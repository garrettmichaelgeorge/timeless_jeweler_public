class DebugComponent < ApplicationComponent
  def initialize(params:)
    @params = params

    super
  end

  def render?
    Rails.env.development?
  end

  private

  attr_reader :params
end
