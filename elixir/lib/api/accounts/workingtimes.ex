defmodule Api.Accounts.Workingtimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtime" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(workingtimes, attrs) do
    workingtimes
    |> cast(attrs, [:start, :end, :user])
    |> validate_required([:start, :end, :user])
  end
end
