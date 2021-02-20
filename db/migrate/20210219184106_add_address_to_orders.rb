class AddAddressToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :street_address, :string
    add_column :orders, :city, :string
    add_column :orders, :state_address, :string
    add_column :orders, :colony, :string
    add_column :orders, :zipcode, :string
  end
end
