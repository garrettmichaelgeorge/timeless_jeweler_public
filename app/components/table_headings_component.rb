class TableHeadingsComponent < ApplicationComponent
  attr_reader :columns, :restful_actions, :labels

  def initialize(columns:, restful_actions:, labels:)
    @columns = columns
    @restful_actions = restful_actions
    @labels = labels
  end

  def list_js_values
    @columns.each { |column| column[:attribute].to_s.camelize(:lower) }
  end

  def colspan_count
    edit_and_destroy_only.count
  end

  def edit_and_destroy_only
    restful_actions.reject { |item| item == :show }
  end
end
