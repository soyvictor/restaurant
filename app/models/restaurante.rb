class Restaurante < ApplicationRecord
  belongs_to :user
  monetize :delivery_fee_cents
end
