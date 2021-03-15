class TableHeaderComponent < ApplicationComponent
  delegate :labels, to: :columns

  def initialize(resources:, columns:, restful_actions:)
    @resources = resources
    @columns = columns
    @restful_actions = restful_actions

    super
  end

  private

  attr_reader :resources, :columns, :restful_actions

  def colspan
    edit_and_destroy_actions.count
  end

  def edit_and_destroy_actions
    restful_actions.reject { |item| item == :show }
  end
end
