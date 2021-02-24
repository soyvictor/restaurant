class AddStatusToRestaurantes < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurantes, :status, :string
  end
end
