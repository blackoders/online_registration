defmodule Customer.Repo.Migrations.CustomerInfo do
  use Ecto.Migration

  def change do
    create table("user info") do
      add :name, :string
      add :aadhar, :integer
      belongs_to 
      timestamps()
    end

  end
end
