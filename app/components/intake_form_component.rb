class IntakeFormComponent < ApplicationComponent
  delegate :setup_product, to: :helpers

  attr_reader :product

  def initialize(product:)
    @product = product
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

  def category_collection
    [
      %w[Jewelry JEWELRY],
      %w[Gemstone GEMSTONE],
      %w[Miscellaneous MISCELLANEOUS]
    ]
  end
end
