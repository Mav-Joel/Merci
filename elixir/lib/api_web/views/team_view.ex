defmodule ApiWeb.TeamView do
  use ApiWeb, :view
  alias ApiWeb.TeamView

  def render("index.json", %{team: team}) do
    %{data: render_many(team, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      id: team.id,
      name: team.name,
      teamNumber: team.teamNumber
    }
  end
end
