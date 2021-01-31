class UserItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :user
  has_many :item_options
end
