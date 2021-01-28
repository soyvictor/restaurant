class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :special_instructions
      t.integer :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
