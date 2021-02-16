class ItemOption < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :user_items
  monetize :price_cents
  validates :name, presence: true
  before_save { name.capitalize! }

  validates :name, presence: true
  validates :price, presence: true
end
