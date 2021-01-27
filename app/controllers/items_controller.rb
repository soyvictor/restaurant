class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @items = Item.all
    @categories = @items.map do |item|
      item.category
    end.uniq
  end

  def show
    @items = Item.find(params[:id])
  end
end
