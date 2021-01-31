class AddOptionsToUserItems < ActiveRecord::Migration[6.0]
  def change
    add_column :user_items, :options, :integer, array: true, default: []
  end
end
