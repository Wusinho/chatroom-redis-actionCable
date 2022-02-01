class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    redirect_to root_path
  end

  private

  def rooms_params
    params.require(:room).permit(:name)
  end

end
