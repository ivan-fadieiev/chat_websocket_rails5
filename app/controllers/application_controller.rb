class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_room
    Room.find(cookies[:room_id]) || Room.new
  end
end
