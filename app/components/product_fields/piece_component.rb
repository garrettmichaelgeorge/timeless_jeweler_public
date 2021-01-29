class ProductFields::PieceComponent < ApplicationComponent
  def initialize(f:)
    @f = f
    super
  end

  private

  attr_reader :f

  def form_object
    f.object
  end

  def build_metal
    Metal.new
  end

  def build_gemstone
    Gemstone.new
  end
end
