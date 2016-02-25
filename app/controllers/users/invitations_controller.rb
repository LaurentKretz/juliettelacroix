class Users::InvitationsController < Devise::InvitationsController


  def create
    today = Date.today
    monday = today - today.cwday + 1
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
end
