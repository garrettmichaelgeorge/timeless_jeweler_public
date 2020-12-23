class ProductFields::PieceComponent < ApplicationComponent
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
end
