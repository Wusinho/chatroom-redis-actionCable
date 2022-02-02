class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to root_path
    end
  end

  def show
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

end
