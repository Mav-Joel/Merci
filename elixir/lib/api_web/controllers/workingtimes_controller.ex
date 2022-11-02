defmodule ApiWeb.WorkingtimesController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Workingtimes

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    workingtime = Accounts.list_workingtime()
    render(conn, "index.json", workingtime: workingtime)
  end

  def create(conn, %{"workingtimes" => workingtimes_params}) do
    with {:ok, %Workingtimes{} = workingtimes} <- Accounts.create_workingtimes(workingtimes_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtimes_path(conn, :show, workingtimes))
      |> render("show.json", workingtimes: workingtimes)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtimes = Accounts.get_workingtimes!(id)
    render(conn, "show.json", workingtimes: workingtimes)
  end

  def update(conn, %{"id" => id, "workingtimes" => workingtimes_params}) do
    workingtimes = Accounts.get_workingtimes!(id)

    with {:ok, %Workingtimes{} = workingtimes} <- Accounts.update_workingtimes(workingtimes, workingtimes_params) do
      render(conn, "show.json", workingtimes: workingtimes)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtimes = Accounts.get_workingtimes!(id)

    with {:ok, %Workingtimes{}} <- Accounts.delete_workingtimes(workingtimes) do
      send_resp(conn, :no_content, "")
    end
  end
end
