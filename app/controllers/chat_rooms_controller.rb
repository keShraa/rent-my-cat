class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    authorize @chat_room
  end

  def create
    @chat_room = ChatRoom.new
    @chat_room.name = "Conversation with: "
    authorize @chat_room
    @chat_room.save
    redirect_to chat_room_path(@chat_room)
  end

  private
end
