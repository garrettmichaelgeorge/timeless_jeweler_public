class ProductFields::GemstoneComponent < ApplicationComponent
  def initialize(f:)
    @f = f
  end

  private

  attr_reader :f

  def form_object
    f.object
  end

  def render?
    form_object.class.reflections.keys.any?(/gemstone/)
  end
end
