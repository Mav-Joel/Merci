defmodule Api.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "team" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
