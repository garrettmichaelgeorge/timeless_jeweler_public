class CardHeaderComponent < ApplicationComponent
  attr_reader :title

  def initialize(title: nil)
    @title = title
  end
end
