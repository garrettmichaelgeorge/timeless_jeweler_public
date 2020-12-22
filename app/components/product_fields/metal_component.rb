class ProductFields::MetalComponent < ApplicationComponent
  attr_reader :f, :form_object

  def initialize(f:)
    @f = f
    @form_object = f.object
  end

  def render?
    # form_object.class.reflections.keys.any?(/metal/)
  end

  def new_record?
    f.object.new_record?
  end
end
