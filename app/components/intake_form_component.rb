class IntakeFormComponent < ApplicationComponent
  def initialize(item:)
    @item = item
  end

  private

  attr_reader :item

  def wrapper_mappings
    { boolean: :custom_boolean,
      check_boxes: :custom_collection,
      date: :custom_multi_select,
      datetime: :custom_multi_select,
      file: :custom_file,
      radio_buttons: :custom_collection,
      range: :custom_range,
      time: :custom_multi_select,
      select: :custom_multi_select }
  end

  def data_form
    { controller: 'nested-form',
      nested_form_wrapper_selector_value: '.nested-form-wrapper' }
  end

  def item_signed_id
    item.to_sgid.to_s
  end
end
