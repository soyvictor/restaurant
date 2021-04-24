class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :set_item, only: [:edit, :update]
  def index

    if user_signed_in? && current_user.user_items.where(state: "pending")
      itemsCount = 0
      current_user.user_items.where(state: "pending").each do |item|
        itemsCount += item.quantity
      end
      @shopping_cart_count = itemsCount
    else
      @shopping_cart_count = 0
    end

    @items = Item.all
    @categories = @items.map do |item|
      item.category
    end.uniq

    respond_to do |format|
          format.html
          format.json { render json: { user_items: @shopping_cart_count } }
        end
    # @restaurant = Restaurant.first
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new
    @item.name = item_params[:name]
    @item.description = item_params[:description]
    @item.category = Category.find(item_params[:category_id])
    @item.price = item_params[:price]
    @item.photo = item_params[:photo]
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @item.update(item_params)
      redirect_to indexAdmin_items_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def indexAdmin
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :price, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
