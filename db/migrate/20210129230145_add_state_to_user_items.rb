class AddStateToUserItems < ActiveRecord::Migration[6.0]
  def change
    add_column :user_items, :state, :string, default: "pending"
  end
end
