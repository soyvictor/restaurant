class AddPriceToItemOptions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :item_options, :price, currency: { present: false }
  end
end
