# frozen_string_literal: true

module Intake
  class SKUComponent < ApplicationComponent
    def initialize(sku: '')
      @sku = sku
    end

    def render?
      sku.present?
    end

    private

    attr_reader :sku
  end
end
