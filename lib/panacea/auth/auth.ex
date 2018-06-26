defmodule Panacea.Auth do
  alias Panacea.Repo

  alias Panacea.Users.User

  def authenticate_user(email, password) do
    Repo.get_by(User, email: email)
    |> check_password(password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, password) do
    case Comeonin.Bcrypt.checkpw(password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end
end
