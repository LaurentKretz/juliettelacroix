class UsersController < ApplicationController

  def show
    @user = record.user
  end

  # def update
  #   current_user.update(user_params)
  #   current_user.save
  #   raise
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require[:user].permit(:first_name, :last_name, :email, :password)
  end

end
