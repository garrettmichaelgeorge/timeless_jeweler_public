# frozen_string_literal: true

class CardStatsComponent < ApplicationComponent
  def initialize(stats:)
    @stats = Array.wrap(stats)
  end

  def column_class_for(stat_index)
    [column_width_class,
     'py-4',
     'text-center',
     border_class_for(stat_index)]
  end

  private

  attr_reader :stats

  def column_width_class
    "col-#{column_width}"
  end

  def column_width
    12 / stats.length
  end

  def border_class_for(stat_index)
    'border-left' unless first_stat?(stat_index)
  end

  def first_stat?(stat_index)
    stat_index.zero?
  end
end
