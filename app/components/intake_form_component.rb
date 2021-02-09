class IntakeFormComponent < ApplicationComponent
  def initialize(item:, auth_token: nil)
    @item = item
    @auth_token = auth_token

    super
  end

  private

  attr_reader :item

  def auth_token
    @auth_token ||= form_authenticity_token
  end

  def item_fields_component = "ProductFields::#{item.class}Component".constantize

  def item_signed_id = item.to_sgid.to_s

  def data_form
    { controller: 'nested-form',
      nested_form_wrapper_selector_value: '.nested-form-wrapper' }
  end
end
