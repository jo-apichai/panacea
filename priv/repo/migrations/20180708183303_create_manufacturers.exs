defmodule Panacea.Repo.Migrations.CreateManufacturers do
  use Ecto.Migration

  def change do
    create table(:manufacturers) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:manufacturers, [:name])
  end
end
