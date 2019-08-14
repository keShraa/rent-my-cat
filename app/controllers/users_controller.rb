class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @user = User.find(params[:id])
    authorize @user
    @cats = @user.cats
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :address, :photo)
  end
end
