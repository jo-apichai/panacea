defmodule PanaceaWeb.HomeController do
  use PanaceaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
