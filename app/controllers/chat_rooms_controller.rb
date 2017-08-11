class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all.to_a
  end

  def new
    @chat_room = ChatRoom.new
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @message = Message.new
  end

  def create
    @chat_room = ChatRoom.create(chat_room_params.merge(user: current_user))
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
