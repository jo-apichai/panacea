defmodule PanaceaWeb.Admin.SessionController do
  use PanaceaWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    %{"email" => email, "password" => password} = session_params

    case Panacea.Auth.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> Panacea.Auth.Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: admin_dashboard_path(conn, :index))
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> Panacea.Auth.Guardian.Plug.sign_out()
    |> redirect(to: home_path(conn, :index))
  end
end
