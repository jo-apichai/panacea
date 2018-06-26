defmodule Panacea.Auth.AuthErrorHandler do
  import Phoenix.Controller, only: [redirect: 2]

  alias PanaceaWeb.Router.Helpers

  def auth_error(conn, {type, _reason}, _opts) do
    case type do
      :unauthenticated ->
        conn
        |> redirect(to: Helpers.admin_sign_in_path(conn, :new))
      :already_authenticated ->
        conn
        |> redirect(to: Helpers.admin_dashboard_path(conn, :index))
    end
  end
end
