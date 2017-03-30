class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'Best Room' # send message in ONE channel
    stream_from "room_id_#{current_room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    #ActionCable.server.broadcast "room_channel", message: data['message']
    Message.create! content: data['message'], room_id: data['room_id']
  end
end
