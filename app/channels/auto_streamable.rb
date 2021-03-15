module AutoStreamable
  # Include this module in a channel to automatically set the channel name based
  # on its class name, reducing boilerplate
  delegate :channel_name, to: :class

  def subscribed
    # Convention over configuration for ActiveCable Channels:
    # Automatically sets the channel name based on the class name
    stream_from channel_name
  end

  def self.channel_name
    to_s.demodulize.sub("Channel").freeze
  end
end
