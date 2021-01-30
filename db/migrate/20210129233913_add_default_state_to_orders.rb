class AddDefaultStateToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :state, :string, default: "pending"
  end
end
