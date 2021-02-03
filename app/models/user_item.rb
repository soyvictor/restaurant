class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order, optional: true
  has_many :item_options
end
