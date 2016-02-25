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

  def update
    @user.update(user_params)
    @user.addresses.create!(address_params)
    redirect_to root_path
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


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def address_params
    params.require(:user).permit(:first_name, :last_name, address: [:street, :city])
  end



end
