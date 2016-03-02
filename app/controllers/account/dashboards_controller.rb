module Account
  class DashboardsController < ApplicationController
    # skip_after_action :verify_authorized, only: :show
    def show
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      if params[:grade_1]
        @perfumes_with_reviews = @kit.perfumes.includes(:reviews).order("reviews.grade1 DESC").reject { |perfume| perfume.reviews.count == 0 }
        @perfumes_without_reviews = @kit.perfumes.select { |perfume| perfume.reviews.count == 0 }
        @perfumes = (@perfumes_with_reviews + @perfumes_without_reviews).flatten
      elsif params[:grade_2]
        @perfumes_with_reviews = @kit.perfumes.includes(:reviews).order("reviews.grade2 DESC").reject { |perfume| perfume.reviews.count == 0 }
        @perfumes_without_reviews = @kit.perfumes.select { |perfume| perfume.reviews.count == 0 }
        @perfumes = (@perfumes_with_reviews + @perfumes_without_reviews).flatten
      elsif params[:grade_3]
        @perfumes_with_reviews = @kit.perfumes.includes(:reviews).order("reviews.grade3 DESC").reject { |perfume| perfume.reviews.count == 0 }
        @perfumes_without_reviews = @kit.perfumes.select { |perfume| perfume.reviews.count == 0 }
        @perfumes = (@perfumes_with_reviews + @perfumes_without_reviews).flatten
      else
        @perfumes = @kit.perfumes
      end
    end

  end
end
