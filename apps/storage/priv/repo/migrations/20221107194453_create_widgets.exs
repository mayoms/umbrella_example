defmodule Storage.Repo.Migrations.CreateWidgets do
  use Ecto.Migration

  def change do
    create table(:widgets) do
      add :name, :string
      add :type, :string
    end
  end
end
