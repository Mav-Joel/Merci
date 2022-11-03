defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ApiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
  end

  pipeline :ensure_auth do
    plug Api.Guardian.AuthPipeline
  end

  scope "/api/admin" do
  end

  scope "/api", ApiWeb do
    pipe_through :api
    resources "/team", TeamController, except: [:new, :edit]

    post "/users/login", UserController, :login
    options "/users/login", UserController, :options
    post "/users/register", UserController, :register
    options "/users/register", UserController, :options
    post "/users/refresh", UserController, :refresh
    options "/users/refresh", UserController, :options
  end

  scope "/api", ApiWeb do
    pipe_through [:api, :ensure_auth]
  
    #Users
    get "/users/:id", UserController, :show
    get "/users", UserController, :index
    put "/users", UserController, :update
    delete "/users", UserController, :delete
    post "/users/logout", UserController, :logout
    options "/users/logout", UserController, :options

    #WorkingTimes
    get "/workingtimes", WorkingtimeController, :show
    get "/workingtimes/one/:id", WorkingtimeController, :singleWorkingTime
    post "/workingtimes", WorkingtimeController, :createByUser
    options "/workingtimes", WorkingtimeController, :options
    put "/workingtimes/:id", WorkingtimeController, :update
    delete "/workingtimes/:id", WorkingtimeController, :delete

    #clocks
    get "/clocks", ClockController, :show
    post "/clocks", ClockController, :createByUser
    options "/clocks", ClockController, :options
  end
end