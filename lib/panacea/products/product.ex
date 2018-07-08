defmodule Panacea.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Panacea.Products.Manufacturer

  schema "products" do
    field :name, :string
    belongs_to :manufacturer, Manufacturer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
