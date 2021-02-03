class RemoveOrderFromUserItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :user_items, :order, index: true, foreign_key: true
  end
end
