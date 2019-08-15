class ReviewsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @review = Review.new
    authorize @review
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(params_review)
    @review.user_id = current_user.id
    authorize @review

    @review.cat = @cat
    if @review.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:description, :rating)
  end
end
