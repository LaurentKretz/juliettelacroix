class OrdersController < ApplicationController

  def new
    # Tentative pour retrouver le panier précédent non fini en cas de log out sans paiement
    # if current_user.orders.where(state:"pending")

    # end
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create!(user:current_user, address:current_user.addresses.first, state:"pending")
    end
    @order.amount = 0
    @order.order_items.each do |order_item|
      @order.amount += order_item.amount
    end
    @order.save
  end

  def create
    @order = Order.find(params[:order_id])
    redirect_to new_checkout_payment_path
  end
end
