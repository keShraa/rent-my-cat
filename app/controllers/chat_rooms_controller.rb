class ChatRoomsController < ApplicationController
  def show
    @booking = Booking.find(params[:booking_id])
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    authorize @chat_room
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @chat_room = ChatRoom.find_or_initialize_by(booking: @booking)
    if current_user == @booking.user
      @chat_room.name = "Chat with #{@booking.cat.user.first_name}"
    else
      @chat_room.name = "Chat with #{@booking.user.first_name}"
    end
    authorize @chat_room
    @chat_room.save
    redirect_to "/bookings/#{@booking.id}/chat_rooms/#{@chat_room.id}"
  end
end
