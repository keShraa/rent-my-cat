class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @booking = Booking.new(params_booking)
    authorize @booking

    @booking.cat = @cat
    @booking.total_price = @cat.price_per_day * (@booking.ending_date - @booking.starting_date).to_i
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
