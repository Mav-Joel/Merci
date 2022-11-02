defmodule Api.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:team) do
      add :name, :string

      timestamps()
    end
  end
end
