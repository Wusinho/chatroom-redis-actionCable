class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
  end

  private

  def rooms_params
    params.require(:rooms).permit(:name)
  end

end
