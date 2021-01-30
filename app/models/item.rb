class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  monetize :price_cents
  has_many :user_items
  has_many :item_options, dependent: :destroy
end
