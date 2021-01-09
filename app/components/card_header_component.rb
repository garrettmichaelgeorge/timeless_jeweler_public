class CardHeaderComponent < ApplicationComponent
  def initialize(title: nil)
    @title = title
  end

  def render?
    # content.empty?
  end

  private

  attr_reader :title
end
