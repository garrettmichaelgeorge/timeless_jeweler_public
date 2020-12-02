class ProductFields::GemstoneComponent < ApplicationComponent
  attr_reader :f, :form_object

  def initialize(f:)
    @f = f
    @form_object = f.object
  end

  def render?
    form_object.class.reflections.keys.any?(/gemstone/)
  end
end
