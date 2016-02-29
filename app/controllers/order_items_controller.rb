class OrderItemsController < ApplicationController

  def create
    @product = Perfume.find(params[:product_id])

    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create!(user_id: current_user.id, address_id: current_user.addresses.first.id, state:"pending")
      session[:order_id] = @order.id
    end

    new_item = OrderItem.create!(product_sku: @product.sku, product_type: params[:product_type], product_id: @product.id, amount: @product.price, quantity: params[:quantity], order:@order)
    flash[:notice] = "#{@product.name} well added to your cart"
    redirect_to account_perfume_path(@product, anchor: "last-card")
  end
end
