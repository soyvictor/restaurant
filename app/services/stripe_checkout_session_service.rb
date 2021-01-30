class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.user_items.each do |user_item|
      user_item.state = "paid"
      user_item.save
    end
    order.update(state: 'paid')
  end
end
