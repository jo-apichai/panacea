defmodule PanaceaWeb.Router do
  use PanaceaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug Panacea.Auth.Pipeline.Authenticated
    plug :put_layout, {PanaceaWeb.LayoutView, :admin}
  end

  pipeline :admin_unauth do
    plug Panacea.Auth.Pipeline.Unauthenticated
    plug :put_layout, {PanaceaWeb.LayoutView, :admin}
  end

  scope "/", PanaceaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
  end

  scope "/admin", PanaceaWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_unauth]

    get "/sign_in", SessionController, :new, as: :sign_in
    post "/sign_in", SessionController, :create, as: :sign_in
  end

  scope "/admin", PanaceaWeb.Admin, as: :admin do
    pipe_through [:browser, :admin]

    get "/", DashboardController, :index
    get "/sign_out", SessionController, :delete, as: :sign_out
  end

  # Other scopes may use custom stacks.
  # scope "/api", PanaceaWeb do
  #   pipe_through :api
  # end
end
