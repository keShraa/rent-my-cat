class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @cats = Cat.where(address: params[:cats][:address])
  end

  def show
  end

  def new
    @user = current_user
    @cat = Cat.new
  end

  def create
    @user = current_user
    @cat = Cat.new(cat_params)
    @cat.user = @user
    if @cat.save
      redirect_to "/user/#{@user[:id]}/cats/#{@cat[:id]}"
      # user_cat_path(@user.@cat)
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
