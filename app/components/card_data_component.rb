class CardDataComponent < ApplicationComponent
  attr_reader :name, :data

  def initialize(name:, data:)
    @name = name
    @data = data
  end
end
