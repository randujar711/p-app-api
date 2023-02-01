class LiveViewChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream from 'live_feed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
