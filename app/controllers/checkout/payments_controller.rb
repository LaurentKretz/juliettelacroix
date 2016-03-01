module Checkout
  class PaymentsController < ApplicationController
    before_action :set_order
    def new


      #Dispay the perfumes kit selected for purchase
      #Display the delivery address enter in the discover controller
      #

    end

    def create
      @amount = @order.amount_cents

      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email: params[:stripeEmail]
      )
      # You should store this customer id and re-use it.

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount:       @amount,  # in cents
        description:  "Payment for order Juliettte Lacroix on #{Date.today}",
        currency:     'eur'
      )

      @order.update(payment: charge.to_json, state: 'paid')
      redirect_to checkout_confirmation_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_payment_path(@order)

    end

  private

    def set_order
      if session[:order_id]
        @order = current_user.orders.where(state: "pending").find(session[:order_id])
      else
        flash[:error] = "Vous n'avez pas encore de panier."
        redirect_to root_path
      end
    end

  end

end
