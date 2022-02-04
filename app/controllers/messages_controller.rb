class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ new create]

  def new
    @message = @room.messages.new
  end


  def create
    @message = @room.messages.new(messages_params)
    # byebug


    mine = ApplicationController.render(
      partial: 'messages/mine', 
      locals: { message: @message } 
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs', 
      locals: { message: @message } 
    )

    if @message.save
      ActionCable.server.broadcast "room_channel_#{@message.room_id}", mine: mine, theirs: theirs, message: @message
      # redirect_to @room
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
