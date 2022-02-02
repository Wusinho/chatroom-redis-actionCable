class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ new create]

  def new
    @message = @room.messages.new
  end


  def create
    @message = @room.messages.new(messages_params)
    # byebug
    if @message.save
      ActionCable.server.broadcast "room_channel_#{@message.room_id}", message: 'hello'
      # ActionCable.server.broadcast "room_channel_", message: 'message from controller'
      # render(html: @message.html_safe)
      redirect_to @room
    end

  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def messages_params
    params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id)
  end
end
