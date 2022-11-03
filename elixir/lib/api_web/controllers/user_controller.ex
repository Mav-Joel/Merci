defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.User
  alias Api.Guardian


  def getpassword(conn, %{"email" => email}) do
    user = Accounts.get_password_by_email(email)
    render(conn, "password.json", user: user)
  end

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      handle_tokens(conn, user)      
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with user <- Accounts.get_by_email!(email) do
      case Bcrypt.verify_pass(password, user.password) do
        true -> handle_tokens(conn, user)
        false ->
          conn
          |> send_resp(200, Jason.encode!(%{error: "connection failed"}))
      end
    end
  end

  def refresh(conn, _params) do
    refresh_token = Plug.Conn.fetch_cookies(conn) |> Map.from_struct() |> get_in([:cookies, "refresh_token"])

    case Api.Guardian.exchange(refresh_token, "refresh", "access") do
      {:ok, _old, {access_token, _new}} ->

      data = %{access_token: access_token, userId: nil}
        conn
        |> put_status(:created)
        |> render("token.json", user_token_info: data)
    end
  end

  defp handle_tokens(conn, user) do
    {:ok, access_token, _claims} = Api.Guardian.encode_and_sign(user, %{id: user.id}, token_type: "access", ttl: {1, :hour})
    {:ok, refresh_token, _claims} = Api.Guardian.encode_and_sign(user, %{id: user.id}, token_type: "refresh", ttl: {30, :day})
    data = %{access_token: access_token, userId: user.id}
    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.user_path(conn, :show, user))
    |> put_resp_cookie("refresh_token", refresh_token)
    |> render("token.json", user_token_info: data)
  end

  def logout(conn, _params) do
    conn
    |> put_status(:no_content)
    |> delete_resp_cookie("refresh_token")
  end

  def index(conn, %{"email" => email, "password" => password}) do
    hash = Bcrypt.hash_pwd_salt(password)
    users = Accounts.get_user_by_email_and_password(email, hash)
    render(conn, "index.json", users: users)
  end

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def verify_user(%{"password" => password} = params) do
    params
    |> Accounts.get_by()
    |> Bcrypt.verify_pass("" ,password)
  end
  
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
