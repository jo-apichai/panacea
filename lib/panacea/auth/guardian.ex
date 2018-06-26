defmodule Panacea.Auth.Guardian do
  use Guardian, otp_app: :panacea

  alias Panacea.Users

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    resource = claims["sub"]
    |> Users.get_user!

    {:ok, resource}
  end
end
