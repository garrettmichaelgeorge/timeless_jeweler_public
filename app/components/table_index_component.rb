class TableIndexComponent < ApplicationComponent
  # TODO: add the ability to make any given column values link elsewhere in the app
  attr_reader :title, :columns, :resources, :restful_actions

  def initialize(title:, columns:, resources:, restful_actions: [])
    @title = title
    @columns = columns
    @resources = resources
    @restful_actions = restful_actions
  end

  def link?
    self[2]
  end

  protected

  def column_for_show?
    self.restful_actions.include?(:show)
  end

  def column_for_edit?
    self.restful_actions.include?(:edit)
  end

  def column_for_destroy?
    self.restful_actions.include?(:destroy)
  end
end
