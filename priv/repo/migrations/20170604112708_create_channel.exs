defmodule JustpushitApi.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :slug, :string
      timestamps()
    end

  end
end
