class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    #texts = Text.where(room_id: message.room_id)
    ActionCable.server.broadcast 'chat_channel', message: render_message(message), user: message.user_id
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'rooms/show_append', locals: { message: message })
  end
end
