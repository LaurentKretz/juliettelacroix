module Checkout
  class PaymentsController < ApplicationController
    before_action :set_order
    def new


      #Dispay the perfumes kit selected for purchase
      #Display the delivery address enter in the discover controller
      #

    end

    def create
      redirect_to checkout_confirmation_path
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
