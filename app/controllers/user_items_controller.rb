class UserItemsController < ApplicationController
  def index
    # @cart = UserItem.all
    @shopping_cart = UserItem.all.where(user: current_user, state: "pending")
    shoppingCartPriceCounter = 0
    shoppingCartQuantity = 0
    @shopping_cart.each do |user_item|
      shoppingCartPriceCounter += (user_item.item.price * user_item.quantity)
      user_item.options.each do |option|
       shoppingCartPriceCounter += (ItemOption.find(option).price * user_item.quantity)
      end
      shoppingCartQuantity += user_item.quantity
    end
    @shopping_cart_total = shoppingCartPriceCounter
    @shopping_cart_quantity = shoppingCartQuantity
  end

  def new
    @user_item = UserItem.new
  end

  def updateOrderQuantity(order)
    order = Order.find(order.id)
    counter = 0
    order.user_items.each do |user_item|
      counter += user_item.quantity
    end
    order.quantity = counter
    order.save!
  end

  def create
    if params["options"]
      theOptions = params["options"]
      theOptionsArray = theOptions.map do |option| ItemOption.find_by(name: option).id end
    else
      theOptionsArray = []
    end

    if theItem = UserItem.find_by(item: Item.find(params["itemId"].to_i), special_instructions: params["specialNotes"], user: current_user, options: theOptionsArray)
      theItem.quantity = theItem.quantity + params["modalQuantity"].to_i
      theItem.save!
      updateOrderQuantity(theItem.order)
    else
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
      if current_user.orders.find_by(state: "pending")
        current_order = current_user.orders.find_by(state: "pending")
        @user_item.order = current_order
        @user_item.save!
        updateOrderQuantity(current_order)
      else
        new_order = Order.new
        new_order.user = current_user
        new_order.save!
        @user_item.order = new_order
        @user_item.save!
        updateOrderQuantity(new_order)
      end
    end
  end

  def edit
  end
end
