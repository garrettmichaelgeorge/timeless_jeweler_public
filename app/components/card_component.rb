class CardComponent < ApplicationComponent
  with_content_areas :header, :body

  def initialize(has_body_margin: true, image_top: {}, inactive: false, inactive_if_empty: false)
    @image_src = image_top[:source]
    @image_alt = image_top[:alt]
    @image_link = image_top[:link_path]
    @inactive = inactive
    @inactive_if_empty = inactive_if_empty
    @has_body_margin = has_body_margin
  end

  private

  attr_reader :inactive, :inactive_if_empty, :has_body_margin,
              :image_src, :image_alt, :image_link

  def card_class
    result = %w[card]
    result << 'card-inactive' if inactive
    result.join(' ')
  end

  def content_area_empty?(content_area)
    content_areas.include? content_area
  end
end
