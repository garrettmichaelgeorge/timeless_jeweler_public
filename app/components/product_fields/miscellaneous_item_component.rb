class ProductFields::MiscellaneousItemComponent < ApplicationComponent
  attr_reader :f

  def initialize(f:)
    @f = f
  end

  def call; end

  private

  def form_object
    f.object
  end
end
