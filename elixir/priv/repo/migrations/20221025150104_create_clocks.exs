defmodule Api.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :string
      add :status, :naive_datetime
      add :user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:clocks, [:user])
  end
end
