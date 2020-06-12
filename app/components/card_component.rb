class CardComponent < ApplicationComponent
  with_content_areas :header, :body
  attr_reader :inactive, :inactive_if_empty
  attr_accessor :card_class

  def initialize(inactive: false, inactive_if_empty: false)
    @inactive = inactive
    @inactive_if_empty = inactive_if_empty
    @card_class = %w[card]
  end

  def before_render
    set_card_class
  end

  def set_card_class
    if inactive || (inactive_if_empty && content_area_empty?(body))
      card_class << "card-inactive"
    end
    card_class.join(" ")
  end

  def content_area_empty?(content_area)
    content_areas.include?(content_area)
  end
end
