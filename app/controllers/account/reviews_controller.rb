module Account
  class ReviewsController < ApplicationController
    skip_after_action :verify_authorized, only: :show
    before_action :find_perfume, :find_user, :update

    def create
      @review = Review.where(user: @user, perfume: @perfume).first_or_initialize
      grade_number = params[:grade]
      return unless %w(1 2 3).include?(grade_number)

      @review["grade#{grade_number}"] = params[:value]
      @review.save

      render json: @review, status: :created
    end

    def update
      if params[:review_id]
        @review = Review.find(params[:review_id])
        grade_number = params[:grade]
        @review["grade#{grade_number}"] = params[:value]
        @review.save

        render json: @review
      end
    end

    def update_review
      @review = Review.find(params[:review_id])
      grade_number = params[:grade]
      @review["grade#{grade_number}"] = params[:value]
      @review.save

    end

    private

    # def review_params
    #   params.require(:review).permit(:grade1, :grade2, :grade3, :content)
    # end

    def find_perfume
      @perfume = Perfume.find(params[:perfume_id])
      # @kit = @user.order_items.kit.order(created_at: "desc").first.product
      # @perfumes = @kit.perfumes
    end

    def find_user
      @user = current_user
    end
  end
end

# <%= simple_form_for([@perfume, @review]) do |f| %>
#             <%= f.error_notification %>

#             <%= form.input :content %>
#             <%= form.button :submit %>
#           <% end %>
