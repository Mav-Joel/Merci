defmodule Api.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "team" do
    field :name, :string
    field :teamNumber, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :teamNumber])
    |> validate_required([:name, :teamNumber])
  end
end
