class UserItemsController < ApplicationController
  def index
    @cart = UserItem.all
  end
end
