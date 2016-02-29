class OrderItemsController < ApplicationController

  def create
    @product = Perfume.find(params[:product_id])
    if session[:order].nil?
      @order = Order.create!(user_id: current_user.id, address_id: current_user.addresses.first.id)
      session[:order] = @order
    else
      @order = Order.find(session[:order]["id"])
    end
    new_item = OrderItem.create!(product_sku: @product.sku, product_type: params[:product_type], product_id: @product.id, amount: @product.price, quantity: params[:quantity], order:@order)
    raise
    redirect_to :back
  end



end
