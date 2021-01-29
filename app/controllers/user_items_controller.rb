class UserItemsController < ApplicationController
  def index
    # @cart = UserItem.all
    @shopping_cart = UserItem.all
  end

  def new
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new
    @user_item.item = Item.find(params["itemId"])
    @user_item.special_instructions = params["specialNotes"]
    @user_item.quantity = params["modalQuantity"]
    @user_item.user = current_user
    if current_user.orders.find_by(state: "pending")
      @user_item.order = current_user.orders.find_by(state: "pending")
      @user_item.save!
    else
      new_order = Order.new
      new_order.user = current_user
      new_order.save!
      @user_item.order = new_order
      @user_item.save!
    end

    redirect_to root_path
  end

  def edit
  end
end
