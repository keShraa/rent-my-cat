class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(params_booking)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:user_id, :cat_id, :starting_date, :ending_date, :total_price)
  end
end
