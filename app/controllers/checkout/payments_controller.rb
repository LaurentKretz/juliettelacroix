module Checkout
  class PaymentsController < ApplicationController
     def new
     end

     def create
      redirect_to checkout_confirmation_path
     end
  end
end
