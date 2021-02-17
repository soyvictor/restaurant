class Address < ApplicationRecord
  belongs_to :user
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :colony, presence: true
  validates :zipcode, presence: true
end
