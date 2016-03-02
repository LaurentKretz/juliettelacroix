class Users::InvitationsController < Devise::InvitationsController
before_action :set_user, only:[:create, :update]

  def create
    today = Date.today
    monday = today - today.cwday + 1

    if params[:user][:email] == ""
      set_flash_message :alert, :email_required
      redirect_to root_path and return
    end

    if User.where('invitation_sent_at >= ?', monday).count <= MAX_NUMBER
      if User.find_by_email(params[:user][:email]).nil?
        super
      else
        set_flash_message :alert, :already_sent, :email => params[:user][:email]
        redirect_to root_path
      end
    else
      set_flash_message :alert, :no_more
      redirect_to root_path
    end
  end

  def edit
    set_minimum_password_length if respond_to? :set_minimum_password_length
    resource.invitation_token = params[:invitation_token]
    @addresses = resource.addresses.build
    render :edit
  end

  def update
  if @user.update!(resource_params)
    #Creation d'un faux order pour accéder au dashboard. Nécessitera stripe
    @order = @user.orders.create!(user: @user, address:@user.addresses.first, state:"pending")
    session[:order_id] = @order.id
    @product = Kit.first
    @order_item = OrderItem.create!(product_sku: @product.sku, product_type: "Kit", product_id: @product.id, amount: @product.price, quantity: 1, order:@order)
    @order.amount = @order_item.amount
    @order.save
    flash.clear
    sign_in(@user)
    redirect_to new_checkout_payment_path

  else
    set_flash_message :alert, :accept_form
    render :edit
  end

  end

  protected

  def authenticate_inviter!
  # everyone can invite
  end

  def current_inviter
    current_user
  end

  def after_invite_path_for(resource)
    resource ? super : root_path
  end

  private

  def set_user
  @user = User.find_by_email(params[:user][:email])
  end


  def resource_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :invitation_limit, :invitation_token, :invitation_accepted_at, addresses_attributes:[:id, :first_name, :last_name, :street, :city])
  end

end
