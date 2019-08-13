class UserController < ApplicationController

  def show
    @user = current_user
    @cats = @user.cats
  end
end
