class ProductFields::GemstoneComponent < FieldsComponent
  delegate :new_record?, to: :form_object, allow_nil: true
end
