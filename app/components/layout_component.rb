# frozen_string_literal: true

class LayoutComponent < ApplicationComponent
  def initialize(columns: 1)
    @columns = columns
  end
end
