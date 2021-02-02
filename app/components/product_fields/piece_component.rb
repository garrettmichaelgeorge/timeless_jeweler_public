class ProductFields::PieceComponent < FieldsComponent
  delegate :metals, :gemstones, :id,
           to: :form_object

  private

  def build_metal
    metals.build
  end

  def build_gemstone
    gemstones.build
  end
end
