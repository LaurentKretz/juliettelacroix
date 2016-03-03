module Account
  class PerfumesController < ApplicationController
    skip_after_action :verify_authorized, only: :show
    before_action :set_perfume

    def show
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    private

    def set_perfume
      @perfume = Perfume.find(params[:id])
    end

  end


end
