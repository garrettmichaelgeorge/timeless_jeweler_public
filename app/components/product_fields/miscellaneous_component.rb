class ProductFields::MiscellaneousComponent < ApplicationComponent
  attr_reader :f

  def initialize(f:)
    @f = f
  end

  def render?
    form_object&.salable_type == 'MISCELLANEOUS'
  end

  private

  def form_object
    f.object
  end
end
