class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.newpr
  end

  def create
    cat = Cat.new(params_cat)
  end

  private

  def params_cat
    params.require(:cat).permit(:name, :description, :address, :breed, :age, :price_per_day, :user_id, :photo)
  end

end
