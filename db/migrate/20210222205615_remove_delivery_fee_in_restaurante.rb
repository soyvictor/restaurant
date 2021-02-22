class RemoveDeliveryFeeInRestaurante < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurantes, :delivery_fee
  end
end
