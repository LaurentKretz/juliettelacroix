class OrdersController < ApplicationController

  def new
    # Tentative pour retrouver le panier précédent non fini en cas de log out sans paiement
    # if current_user.orders.where(state:"pending")

    # end
    if session[:order_id]
      @order = current_user.orders.where(state: "pending").find(session[:order_id])
    else
      @order = current_user.orders.create!(address: current_user.addresses.last, state: "pending")
      session[:order_id] = @order.id
    end

    @order.amount = 0
    @order.order_items.each do |order_item|
      @order.amount += order_item.amount
    end

    @order.save
  end

  def update
    @order = current_user.orders.where(state: "pending").find(session[:order_id])

    if @order.update!(address_id:params[:address_id])
      redirect_to new_checkout_payment_path
    else
      flash[:alert] = "Erreur dans votre adresse. Veuillez en choisir une autre"
      redirect_to edit_checkout_address_path
    end
  end

  def create
    @order = current_user.orders.where(state:'pending').find(params[:order_id])
    if @order.amount == 0
      flash[:alert] = "Your cart is empty"
      redirect_to new_order_path
    else
    redirect_to new_checkout_payment_path
    end
  end
end
