class CustomFormBuilder < SimpleForm::FormBuilder
  CUSTOM_OPTIONS = {
  }.freeze

  def input(attribute_name, options = {}, &block)
    super(attribute_name, options.merge(**CUSTOM_OPTIONS), &block)
  end
end
