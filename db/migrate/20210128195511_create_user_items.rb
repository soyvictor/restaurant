class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.references :item
      t.references :order, null: false, foreign_key: true
      t.string :special_instructions
      t.integer :quantity
      t.references :user

      t.timestamps
    end
  end
end
