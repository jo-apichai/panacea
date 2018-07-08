defmodule Panacea.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :manufacturer_id, references(:manufacturers), null: false

      timestamps()
    end

    create index(:products, :manufacturer_id)
  end
end
