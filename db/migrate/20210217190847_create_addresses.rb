class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :colony
      t.string :zipcode
      t.boolean :saved, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
