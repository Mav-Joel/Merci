defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :role, :string, default: "user"
    field :username, :string
    field :team, :id, default: 1

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :role, :team])
    |> validate_required([:username, :email, :password, :role, :team])
    |> validate_format(:email, ~r/^[A-Za-z0-9.%+-+']+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}$/)
    |> encrypt_and_put_password()
  end

 defp encrypt_and_put_password(user) do
    with password <- fetch_field!(user, :password) do
      encrypted_password = Bcrypt.hash_pwd_salt(password)
      put_change(user, :password, encrypted_password)
    end
  end
end
