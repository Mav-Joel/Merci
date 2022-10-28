defmodule ApiWeb.UserView do
  use ApiWeb, :view
  alias ApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("index.json", %{user: user}) do
    %{data: render_one(user, UserView, "password.json")}
  end

  def render("password.json", %{user: user}) do
    %{
      password: user.password,
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
    }
  end
end
