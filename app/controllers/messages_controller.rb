class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(params[:chat_room_id])
    message = Message.create(body: params[:message][:body], user_id: current_user.id, chat_room: chat_room)
    ActionCable.server.broadcast "chat_rooms_#{chat_room.id}_channel", message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
