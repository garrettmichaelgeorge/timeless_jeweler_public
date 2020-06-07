class TableHeadingsComponent < ApplicationComponent
  attr_reader :columns, :resources, :restful_actions, :labels

  def initialize(columns:, resources:, restful_actions:, labels:)
    @columns = columns
    @resources = resources
    @restful_actions = restful_actions
    @labels = labels
  end

  def before_render
  end

  def list_js_values
    @columns.each { |column| column[:attribute].to_s.camelize(:lower) }
  end

  def colspan_count
    edit_and_destroy_only = restful_actions.reject { |item| item == :show }
    edit_and_destroy_only.count
  end
end
