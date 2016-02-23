module Checkout
  class AddressesController < ApplicationController

 def edit
  @address = Address.new(first_name: "Bertrand", last_name: "Boullay", street: "10 rue Perdonnet", zip_code:75010, city: "Paris", country_code: "FR" )
  #@address = Address.find(params[:id])
  #authorize @address
 end

 def update
  #@address = Address.find(params[:id])
    #if @address.update(address_params)
      #redirect_to checkout_address(@address)
    #else render :new
    #end
  end

 private

  def address_params
    #params.require(:address).permit(:street, :zip_code, :city, :country_code)
  end

  end
end
