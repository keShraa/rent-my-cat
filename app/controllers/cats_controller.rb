class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cats = Cat.all
  end
end
