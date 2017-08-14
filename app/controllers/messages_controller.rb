class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(params[:chat_room_id])
    message = Message.create(body: params[:message][:body], user_id: current_user.id, chat_room: chat_room)
  end
end
