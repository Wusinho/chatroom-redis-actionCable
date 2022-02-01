class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    # byebug
    if @room.save
      redirect_to root_path
    end
  end

  def show
    
  end



  private

  def set_room
    @room = Room.find_by(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

end
