class AddDeliveryFeeToRestaurantes < ActiveRecord::Migration[6.0]
  def change
    add_monetize :restaurantes, :delivery_fee, currency: { present: false }
  end
end
