module Account
  class DashboardsController < ApplicationController
    skip_after_action :verify_authorized, only: :show
    def show
      @user = current_user
      @user.invite!
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

  end
end
