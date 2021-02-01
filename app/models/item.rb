class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  has_many :user_items
  has_many :item_options, dependent: :destroy
  monetize :price_cents

end
