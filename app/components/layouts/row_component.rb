# frozen_string_literal: true

class Layouts::RowComponent < ApplicationComponent
  def initialize(column_ratio: '1')
    @column_ratio = set_up_column_ratio(column_ratio)
  end

  def css_class
    column_ratio.reduce do |memo, col|
    end
  end

  private

  attr_reader :column_ratio

  def set_up_column_ratio(ratio_str)
    ratio_str.split(':')
  end
end
