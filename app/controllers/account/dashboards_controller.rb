module Account
  class DashboardsController < ApplicationController
    # skip_after_action :verify_authorized, only: :show
    def show
      @user = current_user
      @kit = @user.order_items.kit.order(created_at: "desc").first.product

      if params[:grade_1]
        @perfumes = perfumes_ordered_by_grade(:grade1)
      elsif params[:grade_2]
        @perfumes = perfumes_ordered_by_grade(:grade2)
      elsif params[:grade_3]
        @perfumes = perfumes_ordered_by_grade(:grade3)
      elsif params[:not_tested]
        @perfumes = not_tested_perfumes
      else
        @perfumes = @kit.perfumes
      end

      Perfume.all.each do |perfume|
        if perfume.reviews.where(user_id: current_user.id).first.nil?
          perfume.reviews.create!(user:current_user)
        end
      end
    end

    private

    def not_tested_perfumes
      @perfumes_not_tested = @kit.perfumes.
        joins(:reviews).
        where(reviews: { user_id: current_user.id }).
        where("reviews.grade1 IS NULL OR reviews.grade2 IS NULL OR reviews.grade3 IS NULL")

      @perfumes_tested = @kit.perfumes.where.not(id: @perfumes_not_tested.pluck(:id))
      return (@perfumes_not_tested + @perfumes_tested).flatten
    end

    def perfumes_ordered_by_grade(grade)
      @perfumes_with_reviews = @kit.perfumes.
        joins(:reviews).
        where(reviews: { user_id: current_user.id }).
        where.not(reviews: { grade => nil }).
        order("reviews.#{grade} DESC")

      @perfumes_without_reviews = @kit.perfumes.where.not(id: @perfumes_with_reviews.pluck(:id))
      return (@perfumes_with_reviews + @perfumes_without_reviews).flatten
    end
  end
end
