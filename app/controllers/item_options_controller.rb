class ItemOptionsController < ApplicationController
  def new
    @item_option = ItemOption.new
    @items = Item.all
  end

  def create
    @item_option = ItemOption.new
    @item_option.name = item_option_params[:name]
    @item_option.item = Item.find(item_option_params[:item])
    @item_option.price = item_option_params[:price]
    @item_option.user = current_user

    if @item_option.save
      redirect_to root_path
    else
      @items = Item.all
      render :new
    end
  end

  private

  def item_option_params
    params.require(:item_option).permit(:name, :item, :price)
  end
end
