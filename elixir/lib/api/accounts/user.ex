defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :role, :string, default: "user"
    field :username, :string
    field :team, :id, default: 0

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :role, :team])
    |> validate_required([:username, :email, :password, :role, :team])
  end
end
