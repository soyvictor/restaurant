class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order
  has_many :item_options
end
