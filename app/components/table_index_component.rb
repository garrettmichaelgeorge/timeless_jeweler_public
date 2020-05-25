class TableIndexComponent < ApplicationComponent
  def initialize(title:, columns:, resources:)
    @title = title
    @columns = columns
    @resources = resources
  end
end
