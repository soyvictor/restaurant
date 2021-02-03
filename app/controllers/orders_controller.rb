class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def updateOrderQuantityAmount(order)
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
    order.quantity = quantityCounter
    order.amount = priceCounter
    order.save!

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Victor's test",
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
      # order = current_user.orders.find_by(state: "pending")
      if current_user.orders.find_by(state: "pending")
        order = current_user.orders.find_by(state: "pending")
        current_user.user_items.each do |user_item|
          user_item.order = order
          user_item.save!
        end
        updateOrderQuantityAmount(order)
      else
        order = Order.new
        order.user = current_user
        order.save!
        current_user.user_items.each do |user_item|
          user_item.order = order
          user_item.save!
        end
        updateOrderQuantityAmount(order)
      end
  end
end
