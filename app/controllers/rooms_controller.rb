class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    byebug
    if @room.save
      redirect_to root_path
    end
  end

  private

  def rooms_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

end
