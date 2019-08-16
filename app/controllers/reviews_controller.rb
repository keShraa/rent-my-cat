class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @cat = Cat.find(params[:cat_id])
    @review = Review.new(params_review)
    @review.cat = @cat
    @review.user_id = current_user.id
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to cat_path(@cat) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cats/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def params_review
    params.require(:review).permit(:description, :rating)
  end
end
