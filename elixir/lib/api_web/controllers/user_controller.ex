defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.User

  action_fallback ApiWeb.FallbackController

  def getpassword(conn, %{"email" => email}) do
    user = Accounts.get_password_by_email(email)
    render(conn, "password.json", user: user)
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
