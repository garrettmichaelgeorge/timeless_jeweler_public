class IntakeFormComponent < ApplicationComponent
  def initialize(item:, auth_token: nil)
    @item = item
    @auth_token = auth_token

    super
  end

  private

  attr_reader :item

  def render_form?
    item.category.present?
  end

  def auth_token
    @auth_token ||= form_authenticity_token
  end

  def item_fields_component = "ProductFields::#{item.class}Component".constantize

  def item_signed_id = item.to_sgid.to_s

  def data_form
    { controller: 'nested-form',
      nested_form_wrapper_selector_value: '.nested-form-wrapper' }
  end

  def acquired_at_start_year
    2010
  end

  def acquired_at_end_year(calendar = Date)
    calendar.today.year
  end
end
