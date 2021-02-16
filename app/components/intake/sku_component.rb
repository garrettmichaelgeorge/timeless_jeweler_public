# frozen_string_literal: true

module Intake
  class SKUComponent < ApplicationComponent
    def initialize(item:)
      @item = item
    end

    def render?
      item.category == 'Piece'
    end

    private

    attr_reader :item
  end
end
