defmodule ApiWeb.TeamController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Team

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    team = Accounts.list_team()
    render(conn, "index.json", team: team)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- Accounts.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Accounts.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Accounts.get_team!(id)

    with {:ok, %Team{} = team} <- Accounts.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Accounts.get_team!(id)

    with {:ok, %Team{}} <- Accounts.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
