class RoomsController < ApplicationController
  before_action :find_room, except: :index
  def show
    @messages = @room.messages
  end

  def index
    @rooms = Room.all
  end

  private
  def find_room
    @room = Room.find(params[:id])
    cookies[:room_id] = @room.try(:id)
  end
end
