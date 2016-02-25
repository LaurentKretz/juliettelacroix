module Account
  class PerfumesController < ApplicationController
    skip_after_action :verify_authorized, only: :show
    before_action :set_perfume, only: [:show, :step1, :step2, :step3, :step4, :step5, :step6]

    def show
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step1
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step2
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step3
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step4
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step5
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def step6
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
