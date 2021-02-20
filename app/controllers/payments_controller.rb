class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: "pending").find(params[:order_id])
    @contact = Contact.new
    @address = Address.new
    @restaurant = Restaurante.first
  end


end
