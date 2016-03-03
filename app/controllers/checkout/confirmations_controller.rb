module Checkout
  class ConfirmationsController < ApplicationController

    def show
      if session[:order_id].nil?
        redirect_to account_dashboard_path
      else
        @order = Order.find(session[:order_id])
        session[:order_id] = nil
      end
    end
  end
end
