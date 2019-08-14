class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = policy_scope(Cat)
    @user = current_user
    unless params[:cats][:address] == ""
      @cats = Cat.where(address: params[:cats][:address])
      # @cats = Cat.geocoded #returns cats with coordinates
      @markers = @cats.map do |cat|
        {
          lat: cat.latitude,
          lng: cat.longitude
        }
      end
    else
      @cats = Cat.all
      # @cats = Cat.geocoded #returns cats with coordinates
      @markers = @cats.map do |cat|
        {
          lat: cat.latitude,
          lng: cat.longitude
        }
      end
    end
  end

  def show
    authorize @cat
  end

  def new
    @user = current_user
    @cat = Cat.new
    authorize @cat
  end

  def create
    @user = current_user
    @cat = Cat.new(cat_params)
    @cat.user = @user
    authorize @cat
    if @cat.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    authorize @cat
  end

  def update
    authorize @cat
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
    params.require(:cat).permit(:name, :description, :age, :address, :breed, :price_per_day, :gender, :photo)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def make_markers(cats)
    # @cats = Cat.geocoded #returns cats with coordinates
    markers = cats.map do |cat|
    {
      lat: cat.latitude,
      lng: cat.longitude
    }
    return markers
  end
end

end
