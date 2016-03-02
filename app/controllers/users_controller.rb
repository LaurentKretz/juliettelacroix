# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  admin                  :boolean          default(FALSE), not null
#  first_purchase         :boolean          default(FALSE)
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:subscribe]


  def show
    @user = record.user
  end

  def subscribe
    if params[:email] =~ /^([^@\s]+)@([-a-z0-9A-Z]+)\.([a-zA-Z]{2,})$/
      SubscribeToNewsletter.new(params[:email]).run
      flash[:notice] = "Vous avez bien été inscrit à notre newsletter !"
      redirect_to :back
    else
      flash[:alert] = "Invalid email"
      redirect_to :back
    end
  end
end
