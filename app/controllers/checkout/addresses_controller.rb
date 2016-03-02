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
    if @address = current_user.addresses.create!(address_params)
      @order = current_user.orders.where(state: "pending").find(session[:order_id])
      if @order.update!(address:@address)
        redirect_to new_checkout_payment_path
      else
        flash[:alert] = "Erreur dans votre adresse. Veuillez en choisir une autre"
        redirect_to edit_checkout_address_path
      end
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
