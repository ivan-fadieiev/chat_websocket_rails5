class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # ActionCable.server.broadcast "Best Room", message: render_message(message) # send message in ONE channel
    ActionCable.server.broadcast "room_id_#{message.room_id}", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
