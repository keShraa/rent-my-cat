class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.where("user_id = #{current_user.id}")
    @bookings_for_cat_owner = []
    user_cats = current_user.cats
    user_cats.each do |cat|
      cat.booking.each do |booking|
        @bookings_for_cat_owner << booking
      end
    end
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

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.delete
    redirect_to bookings_path
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "accepted")
    redirect_to booking_path(@booking)
  end

  def refuse
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "refused")
    redirect_to booking_path(@booking)
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
