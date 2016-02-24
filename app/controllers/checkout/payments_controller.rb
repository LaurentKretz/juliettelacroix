module Checkout
  class PaymentsController < ApplicationController

    def new

      #Dispay the perfumes kit selected for purchase
      #Display the delivery address enter in the discover controller
      #

    end

    def create
      redirect_to checkout_confirmation_path
    end
  end
end
