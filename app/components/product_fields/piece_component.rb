class ProductFields::PieceComponent < ApplicationComponent
  def initialize(f:)
    @f = f
  end

  private

  attr_reader :f

  def form_object
    f.object
  end
end
