class OrderItemsController < ApplicationController

  def create
    @product = Perfume.find(params[:product_id])

    if session[:order_id]
      @order = current_user.orders.where(state: "pending").find(session[:order_id])
    else
      @order = current_user.orders.create!(address: current_user.addresses.first, state: "pending")
      session[:order_id] = @order.id
    end

    new_item = OrderItem.create!(product_sku: @product.sku, product_type: params[:product_type], product_id: @product.id, amount: @product.price, quantity: params[:quantity], order:@order)

    flash[:notice] = "#{@product.name}  bien ajouté à #{ActionController::Base.helpers.link_to "votre panier", new_order_path}"
    if request.referrer.include? ("account/dashboard")
      redirect_to new_order_path
      else
      redirect_to account_perfume_path(id:@product.id, anchor: "last-card")
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to new_order_path
  end

end
