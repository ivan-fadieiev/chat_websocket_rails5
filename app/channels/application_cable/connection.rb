module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_room

    def connect
      self.current_room = find_current_room
    end

    private
    def find_current_room
      @current_room = Room.find(cookies[:room_id])
    end
  end
end
