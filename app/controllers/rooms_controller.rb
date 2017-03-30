class RoomsController < ApplicationController
  protect_from_forgery :except => [:create]

  before_action :find_room, except: :index

  def show
    @messages = @room.messages
  end

  def index
    @rooms = Room.all
  end

  def create
    @msg = @room.messages.create(content: params[:content])
    ActionCable.server.broadcast "room_id_#{@msg.room_id}", message: render_message(@msg)
    head :ok
  end

  private
  def find_room
    @room = Room.find(params[:id])
    cookies[:room_id] = @room.try(:id)
  end
end
