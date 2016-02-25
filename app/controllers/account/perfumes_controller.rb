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
    end

    def step2
    end

    def step3
    end

    def step4
    end

    def step5
    end

    def step6
    end

    private

    def set_perfume
      @perfume = Perfume.find(params[:id])
    end

  end


end
