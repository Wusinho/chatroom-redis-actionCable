class RoomChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    puts '--------------'
    puts params[:room_id]
    stream_from "room_channel_#{params[:room_id]}" #if user_signed_in?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
