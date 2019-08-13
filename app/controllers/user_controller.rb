class UserController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @cats = @user.cats
  end
end
