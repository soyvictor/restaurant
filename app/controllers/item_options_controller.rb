class ItemOptionsController < ApplicationController
  before_action :set_item_option, only: [:edit, :update]

  def index
    @item_options = ItemOption.all
  end

  def new
    @item_option = ItemOption.new
    @items = Item.all
  end

  def create
    @item_option = ItemOption.new
    @item_option.name = item_option_params[:name]
    @item_option.item = Item.find(item_option_params[:item_id])
    @item_option.price = item_option_params[:price]
    @item_option.user = current_user

    if @item_option.save
      redirect_to root_path
    else
      @items = Item.all
      render :new
    end
  end

  def edit
    @items = Item.all
  end

  def update
    if @item_option.update(item_option_params)
      redirect_to item_options_path
    else
      render :edit
    end
  end

  private

  def item_option_params
    params.require(:item_option).permit(:name, :item_id, :price)
  end

  def set_item_option
    @item_option = ItemOption.find(params[:id])
  end
end
