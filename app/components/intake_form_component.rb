class IntakeFormComponent < ApplicationComponent
  def initialize(item:)
    @item = item

    super
  end

  private

  attr_reader :item

  def item_fields_component = "ProductFields::#{item.class}Component".constantize

  def item_signed_id = item.to_sgid.to_s

  def data_form
    { controller: 'nested-form',
      nested_form_wrapper_selector_value: '.nested-form-wrapper' }
  end
end
