defmodule PanaceaWeb.Router do
  use PanaceaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug :put_layout, {PanaceaWeb.LayoutView, :admin}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PanaceaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
  end

  scope "/admin", PanaceaWeb.Admin do
    pipe_through :browser
    pipe_through :admin

    get "/", DashboardController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PanaceaWeb do
  #   pipe_through :api
  # end
end
