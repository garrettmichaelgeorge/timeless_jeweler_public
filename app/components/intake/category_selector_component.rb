# frozen_string_literal: true

class Intake::CategorySelectorComponent < ApplicationComponent
  CATEGORY_ICONS = {
    'Piece' => :watch,
    'LooseGemstone' => :square,
    'MiscellaneousItem' => :shopping_bag
  }

  delegate :categories, to: :model, prefix: true

  def initialize(model: Item)
    @model = model

    super
  end

  private

  attr_reader :model

  def id_for(category)
    "option#{category.camelize}"
  end

  def label_text_for(category)
    category.underscore.humanize.titleize
  end

  def icon_for(category)
    icon fetch_icon(category)
  end

  def fetch_icon(category)
    CATEGORY_ICONS.fetch(category) { default_icon }
  end

  def default_icon
    :disc
  end
end
