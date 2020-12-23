class ProductFields::MetalComponent < ApplicationComponent
  private

  attr_reader :f

  public

  def initialize(f:)
    @f = f
  end

  private

  def form_object
    f.object
  end

  def new_record?
    f.object.new_record?
  end
end
