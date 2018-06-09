defmodule Panacea.Factory do
  use ExMachina.Ecto, repo: Panacea.Repo

  use Panacea.UserFactory
end
