# frozen_string_literal: true

class CardImageTopComponent < ApplicationComponent
  def initialize(src: nil, alt: '', link: nil)
    @src = src
    @alt = alt
    @link = link
  end

  def call
    if link
      call_link
    else
      render_image
    end
  end

  def call_link
    link_to link do
      render_image
    end
  end

  def render?
    !src.nil?
  end

  private

  attr_reader :src, :alt, :link

  def render_image
    image_tag src, class: css_class, alt: alt
  end

  def css_class
    'card-img-top'
  end
end
