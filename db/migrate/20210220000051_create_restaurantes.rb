class CreateRestaurantes < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurantes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :delivery_fee

      t.timestamps
    end
  end
end
