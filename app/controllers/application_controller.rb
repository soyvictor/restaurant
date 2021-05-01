class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_counter

  private

  def set_counter
    if user_signed_in? && current_user.user_items.where(state: "pending")
      @cart_count = current_user.user_items.where(state: "pending").reduce(0) do |sum,item|
        sum + item.quantity
      end
    else
      @cart_count = 0
    end
  end
end






