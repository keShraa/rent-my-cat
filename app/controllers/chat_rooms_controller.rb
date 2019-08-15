class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    authorize @chat_room
  end

  def new
    @chat_room = ChatRoom.new
    authorize @chat_room
  end

  def create
    @chat_room = ChatRoom.new(chatroom_params)
    authorize @chat_room
    @chat_room.save
    redirect_to chat_room_path(@chat_room)
  end

  private

  def chatroom_params
    params.require(:chat_room).permit(:name)
  end
end
