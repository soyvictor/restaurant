class AddOrderToUserItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_items, :order, index: true
  end
end
