class ProductFields::PieceComponent < ApplicationComponent
  attr_reader :f, :form_object

  def initialize(f:)
    @f = f
    @form_object = f.object
  end

  def render?
    form_object&.salable_type == 'Piece'
  end
end
