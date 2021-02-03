class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
      order = current_user.orders.find_by(state: "pending")
      order.amount = params["shopping_cart_total"]
      order.save

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Victor's test",
          amount: order.amount_cents,
          currency: 'mxn',
          quantity: order.quantity
        }],
        success_url: order_url(order),
        cancel_url: order_url(order)
      )

      order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(order)
  end
end
