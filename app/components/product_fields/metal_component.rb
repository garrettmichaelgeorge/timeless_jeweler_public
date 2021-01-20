class ProductFields::MetalComponent < ApplicationComponent
  def initialize(f:)
    @f = f
  end

  private

  attr_reader :f

  def form_object
    f.object
  end

  def new_record?
    form_object && form_object.new_record?
  end
end
