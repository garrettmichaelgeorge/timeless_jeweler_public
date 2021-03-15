class ProductFields::GemstoneComponent < FieldsComponent
  def initialize(f:)
    super
  end

  private

  def removable?
    form_object.mounted? && new_record?
  end
end
