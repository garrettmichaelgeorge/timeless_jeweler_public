class DebugComponent < ApplicationComponent
  attr_reader :params

  def initialize(params:)
    @params = params
  end

  def render?
    Rails.env.development?
  end
end
