# frozen_string_literal: true

class ProductFields::LooseGemstoneComponent < ApplicationComponent
  def initialize(f:)
    @f = f
  end

  def render? = false
end
