class TableHeaderCellComponent < ApplicationComponent
  def initialize(label:)
    @label = label
  end

  private

  attr_reader :label
end
