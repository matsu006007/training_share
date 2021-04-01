class DestroyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "destroy_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
