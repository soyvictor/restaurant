class UserItemsController < ApplicationController
  def index
    # @cart = UserItem.all
    @cart = UserItem.all
  end

  def new
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new
    @user_item.item = Item.find(params["item_id"])
    @user_item.special_instructions = params["special-options"]
    @user_item.quantity = params["modal-quantity"]
    @user_item.user = current_user
    @user_item.order = Order.first
    @user_item.save!
    redirect_to root_path
  end

  def edit
  end
end
