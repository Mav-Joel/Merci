defmodule Api.Repo.Migrations.CreateWorkingtime do
  use Ecto.Migration

  def change do
    create table(:workingtime) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:workingtime, [:user])
  end
end
