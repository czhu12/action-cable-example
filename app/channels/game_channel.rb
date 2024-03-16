class GameChannel < ApplicationCable::Channel
  def subscribed
    game_id = params[:game_id]
    stream_from "game_channel_#{game_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Example: Broadcast received data back to the channel (for testing purposes)
    game_id = params[:game_id]
    ActionCable.server.broadcast("game_channel_#{game_id}", data)
  end
end
