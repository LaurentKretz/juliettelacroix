module Checkout
  class AddressesController < ApplicationController

 def edit
  # @address = Address.new(first_name: "Bertrand", last_name: "Boullay", street: "10 rue Perdonnet", zip_code:75010, city: "Paris", country_code: "FR" )
  @address = Address.first
  #@address = Address.find(params[:id])
  #authorize @address
 end

 def update
  @address = current_user.addresses.last
    if @address.update!(address_params)
      redirect_to new_checkout_payment_path
    else
      render :new
    end
  end

  def create
    if current_user.addresses.create!(address_params)
      redirect_to order_path(session[:order_id], address_id:current_user.addresses.last), method: "put"
    else
      render :new
    end
  end


 private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :street, :zip_code, :city, :country_code)
  end

  end
end
