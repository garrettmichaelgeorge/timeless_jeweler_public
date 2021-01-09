class CardDataContainerComponent < ApplicationComponent
  def initialize(attrs:)
    @attrs = attrs
  end

  private

  attr_reader :attrs

  def attr_ary
    ary = []
    attrs.each_pair { |key, value| add_hash_to_ary(ary, key, value) }
    ary
  end

  def add_hash_to_ary(ary, key, value)
    ary.push({ name: key, value: value })
  end
end
