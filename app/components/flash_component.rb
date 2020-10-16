class FlashComponent < ApplicationComponent
  attr_reader :message_type, :message
  def initialize(message_type:, message:)
    @message_type = message_type
    @message = message
  end
end
