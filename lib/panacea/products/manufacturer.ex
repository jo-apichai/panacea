defmodule Panacea.Products.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "manufacturers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
