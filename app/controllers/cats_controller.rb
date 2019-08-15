class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_cat, only: %i[show edit update destroy]

  def markers
    @markers = @cats.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { cat: cat })
      }
    end
  end

  def index
    @cats = policy_scope(Cat)
    @user = current_user
    if params[:cats][:address] == ""
      @cats = Cat.all
      # @cats = Cat.geocoded #returns cats with coordinates
    else
      @cats = Cat.where(address: params[:cats][:address])
      # @cats = Cat.geocoded #returns cats with coordinates
    end
    markers
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
    @user = current_user
    authorize @cat
    @cat.destroy
    redirect_to user_path(@user)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :description, :age, :address, :breed, :price_per_day, :gender, :photo)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
