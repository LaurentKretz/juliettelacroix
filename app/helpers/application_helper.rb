module ApplicationHelper

  def resource_name
  :user
  end

  def resource
  @resource ||= User.new
  end

  def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
  end

  def current_user_review(perfume)
    perfume.reviews.where(user_id: current_user.id).first
  end
end
