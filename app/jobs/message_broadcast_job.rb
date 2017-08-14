class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(json_message)
    message = Message.find(JSON.parse(json_message)['id'])
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
