class SKUChannel < ApplicationCable::Channel
  include AutoStreamable

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
