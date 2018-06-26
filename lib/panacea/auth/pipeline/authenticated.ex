defmodule Panacea.Auth.Pipeline.Authenticated do
  use Guardian.Plug.Pipeline, otp_app: :panacea

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
