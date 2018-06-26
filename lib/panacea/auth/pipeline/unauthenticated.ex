defmodule Panacea.Auth.Pipeline.Unauthenticated do
  use Guardian.Plug.Pipeline, otp_app: :panacea

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureNotAuthenticated
end
