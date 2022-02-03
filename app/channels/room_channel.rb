class RoomChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    # puts '--------------'
    # puts params[:room_id]
    # puts params[:room_id]
    stream_from "room_channel_#{params[:room_id]}" if current_user && params[:room_id]
  end

  def unsubscribed
    # return if params[:room_id] == nil 
    # Any cleanup needed when channel is unsubscribed
  end
end
