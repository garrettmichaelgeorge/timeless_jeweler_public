class CardDataComponent < ApplicationComponent
  with_collection_parameter :attr

  def initialize(attr:)
    @attr = attr
  end

  private

  attr_reader :attr

  def attr_name
    attr[:name].to_s.humanize
  end

  def attr_value
    attr[:value]
  end
end
