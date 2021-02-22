class AddSubTotalToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :subtotal, currency: { present: false }
  end
end
