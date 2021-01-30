class OrdersController < ApplicationController
  def show
  end

  def create
      order = current_user.orders.find_by(state: "pending")

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Victor's test",
          amount: 1000,
          currency: 'mxn',
          quantity: 1
        }],
        success_url: order_url(order),
        cancel_url: order_url(order)
      )

      order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(order)
  end
end
