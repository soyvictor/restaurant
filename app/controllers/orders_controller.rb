class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def setOrderType
    # @order = current_user.orders.where(state: "pending").find(params[:id])
    @order = current_user.orders.where(state: "pending").find(78)
    @order.order_type = params[:order_type]
    if params[:order_type] == "delivery"
      @order.amount = @order.subtotal + Restaurante.first.delivery_fee
    else
      @order.amount = @order.subtotal
    end
    @order.save!
    redirect_to user_items_path

    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: "Test Order",
    #     amount: @order.amount_cents,
    #     currency: 'mxn',
    #     quantity: 1
    #   }],
    #   success_url: order_url(@order),
    #   cancel_url: order_url(@order)
    # )

    # @order.update(checkout_session_id: session.id)
    # redirect_to new_order_payment_path(@order)

  end

  def addContact
    @order = current_user.orders.where(state: "pending").find(params[:id])
    @order.first_name = params[:first_name]
    @order.last_name = params[:last_name]
    @order.email = params[:email]
    @order.phone = params[:phone]

    if params[:street_address]
      @order.street_address = params[:street_address]
      @order.city = params[:city]
      @order.state_address = params[:state]
      @order.colony = params[:colony]
      @order.zipcode = params[:zipcode]
    end

    @order.save!

    if params[:saved]
      @contact = Contact.new
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.phone = params[:phone]
      @contact.user = current_user
      @contact.save!
    end
  end

  def updateOrderQuantityAmount(order)
    restaurant = Restaurante.first
    order = Order.find(order.id)
    quantityCounter = 0
    priceCounter = 0
    order.user_items.where(state: "pending").each do |user_item|
      quantityCounter += user_item.quantity
      priceCounter += (user_item.item.price * user_item.quantity)
      user_item.options.each do |option|
      priceCounter += (ItemOption.find(option).price * user_item.quantity)
      end
    end
    if order.order_type == 'delivery'
      order.amount = priceCounter + restaurant.delivery_fee
    else
      order.amount = priceCounter
    end

    order.quantity = quantityCounter
    order.subtotal = priceCounter
    # order.amount = priceCounter
    order.save!

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Test Order",
        amount: order.amount_cents,
        currency: 'mxn',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def create
    if current_user.orders.find_by(state: "pending")
      order = current_user.orders.find_by(state: "pending")
      current_user.user_items.each do |user_item|
        user_item.order = order
        user_item.save!
      end
      order.order_type = params[:order_type]
      order.save!
      updateOrderQuantityAmount(order)
    else
      order = Order.new
      order.user = current_user
      order.save!
      current_user.user_items.each do |user_item|
        user_item.order = order
        user_item.save!
      end
      order.order_type = params[:order_type]
      order.save!
      updateOrderQuantityAmount(order)
    end
  end

end
