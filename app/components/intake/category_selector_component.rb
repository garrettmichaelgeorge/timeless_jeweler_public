# frozen_string_literal: true

class Intake::CategorySelectorComponent < ApplicationComponent
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
end
