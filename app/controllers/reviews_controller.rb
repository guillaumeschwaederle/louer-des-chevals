class ReviewsController < ApplicationController
  before_action :set_cheval
  def new
    if current_user
      @review = Review.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @review = Review.new(review_params)
    @review.cheval = @cheval

    if @review.save
      redirect_to @cheval
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.profile == @cheval.profile
      redirect_to new_user_session_path
    end
  end

  def update
    @review = @cheval.reviews.find(params[:id])
  end

  def delete
    @review.destroy
    redirect_to @cheval
  end

private

  def set_cheval
    @cheval = Cheval.find(params[:cheval_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :cheval_id, :profile_id)
  end
end

