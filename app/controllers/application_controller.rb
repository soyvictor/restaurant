class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_counter

  private

  def set_counter
    itemsCount = 0
    if user_signed_in? && current_user.user_items.where(state: "pending")
      current_user.user_items.where(state: "pending").each do |item|
        itemsCount += item.quantity
      end
    end
    @cart_count = itemsCount
  end
end






