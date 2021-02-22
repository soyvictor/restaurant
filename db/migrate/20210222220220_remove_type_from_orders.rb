class RemoveTypeFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :type
  end
end
