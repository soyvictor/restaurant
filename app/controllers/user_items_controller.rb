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
    item_id
    special_instructions
    quantity
    @user = current_user
    @user_item.save
    redirect_to user_items_path
  end

  def edit
  end
end
