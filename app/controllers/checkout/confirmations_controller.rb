module Checkout
  class ConfirmationsController < ApplicationController

    def show
      @order = Order.find(session[:order_id])
    end

  end
end
