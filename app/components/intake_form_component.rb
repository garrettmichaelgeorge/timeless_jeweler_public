class IntakeFormComponent < ApplicationComponent
  SALABLE_TYPES = %w[Piece Gemstone MiscellaneousItem].freeze

  attr_reader :item

  def initialize(item:)
    @item = item
  end

  def wrapper_mappings
    {
      boolean: :custom_boolean,
      check_boxes: :custom_collection,
      date: :custom_multi_select,
      datetime: :custom_multi_select,
      file: :custom_file,
      radio_buttons: :custom_collection,
      range: :custom_range,
      time: :custom_multi_select,
      select: :custom_multi_select
    }
  end

  def data_reflex_build_salable
    {
      reflex: 'change->ItemReflex#build_salable',
      reflex_dataset: 'combined',
      controller: 'item'
    }
  end

  def data_reflex_submit
    {
      reflex: 'input->ItemReflex#submit',
      reflex_dataset: 'combined',
      controller: 'item',
      id: item.id
    }
  end

  def form_defaults
    { input_html: { data: data_reflex_submit } }
  end
end
