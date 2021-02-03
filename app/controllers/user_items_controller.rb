class UserItemsController < ApplicationController
  def index
    # @cart = UserItem.all
    @shopping_cart = UserItem.where(user: current_user, state: "pending")
    @shoppingCartPriceCounter = 0
    @shoppingCartQuantity = 0
    @shopping_cart.each do |user_item|
      @shoppingCartPriceCounter += (user_item.item.price * user_item.quantity)
      @shoppingCartQuantity += user_item.quantity
      user_item.options.each do |option|
       @shoppingCartPriceCounter += (ItemOption.find(option).price * user_item.quantity)
      end
    end

    # if shopping_cart = current_user.orders.find_by(state: "pending")
    #   @shopping_cart_total = shopping_cart.amount
    #   @shopping_cart_quantity = shopping_cart.quantity
    # else
    #   @shopping_cart_total = 0
    #   @shopping_cart_quantity = 0
    # end
  end

  def new
    @user_item = UserItem.new
  end

  # def updateOrderQuantityAmount(order)
  #   order = Order.find(order.id)
  #   quantityCounter = 0
  #   priceCounter = 0
  #   order.user_items.where(state: "pending").each do |user_item|
  #     quantityCounter += user_item.quantity
  #     priceCounter += (user_item.item.price * user_item.quantity)
  #     user_item.options.each do |option|
  #     priceCounter += (ItemOption.find(option).price * user_item.quantity)
  #     end
  #   end
  #   order.quantity = quantityCounter
  #   order.amount = priceCounter
  #   order.save!
  # end

  def create
    if params["options"]
      theOptions = params["options"]
      theOptionsArray = theOptions.map do |option| ItemOption.find_by(name: option).id end
    else
      theOptionsArray = []
    end

    # if theItem = UserItem.find_by(item: Item.find(params["itemId"].to_i), special_instructions: params["specialNotes"], user: current_user, options: theOptionsArray, state: "pending")
    #   theItem.quantity = theItem.quantity + params["modalQuantity"].to_i
    #   theItem.save!
    #   # updateOrderQuantityAmount(theItem.order)
    # else
      @user_item = UserItem.new
      @user_item.item = Item.find(params["itemId"])
      @user_item.special_instructions = params["specialNotes"]
      @user_item.quantity = params["modalQuantity"]
      @user_item.user = current_user
      if params["options"]
        options = params["options"]
        options.each do |option|
          @user_item.options << ItemOption.find_by(name: option).id.to_i
        end
      end
      @user_item.save!
      # if current_user.orders.find_by(state: "pending")
      #   current_order = current_user.orders.find_by(state: "pending")
      #   @user_item.order = current_order
      #   @user_item.save!
      #   updateOrderQuantityAmount(current_order)
      # else
      #   new_order = Order.new
      #   new_order.user = current_user
      #   new_order.save!
      #   @user_item.order = new_order
      #   @user_item.save!
      #   updateOrderQuantityAmount(new_order)
      # end
    end


  def edit
  end
end
