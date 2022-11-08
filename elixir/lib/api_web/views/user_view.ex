defmodule ApiWeb.UserView do
  use ApiWeb, :view
  alias ApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
      role: user.role,
      team: user.team,
    }
  end

  def render("token.json", %{user_token_info: token}) do
   %{
    access_token: token.access_token,
    userId: token.userId,
    username: token.username
   }
  end
end
