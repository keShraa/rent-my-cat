class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @cats = @user.cats
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :address, :photo)
  end
end
