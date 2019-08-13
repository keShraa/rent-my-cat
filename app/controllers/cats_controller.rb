class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description, :age, :address, :breed, :price_per_day, :photo)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
