module Account
  class ReviewsController < ApplicationController
    skip_after_action :verify_authorized, only: :show
    before_action :find_perfume, :find_user

    def show
    end

    def new
      @review = Review.new
    end

    def create
      @review = @perfume.reviews.build(review_params)
      @review.save
    end


    private

    def review_params
      params.require(:review).permit(:grade1, :grade2, :grade3, :content)
    end

    def find_perfume
      @perfume = Perfume.find(params[:perfume_id])
      @kit = @user.order_items.kit.order(created_at: "desc").first.product
      @perfumes = @kit.perfumes
    end

    def find_user
      @user = User.find(params[:user_id])
      @user = current_user
    end

  end


end

# <%= simple_form_for([@perfume, @review]) do |f| %>
#             <%= f.error_notification %>

#             <%= form.input :content %>
#             <%= form.button :submit %>
#           <% end %>
