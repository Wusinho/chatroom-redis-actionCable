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
    # redirect_to :back
    # redirect_to :back
    # if @room
    #   respond_to do |format|
    #     format.js {render inline: "location.reload();" }
    #   end
    # end
    # redirect_back(fallback_location: @room.id)
    # redirect_to @room
    # @rooms = Room.all
    # render 'index'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end

end
