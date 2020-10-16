class TableRowComponent < ApplicationComponent
  def initialize(resource:, columns:, restful_actions:)
    @resource = resource
    @columns = columns
    @restful_actions = restful_actions
  end

  private

  attr_reader :resource, :columns, :restful_actions

  def render_cell(resource, column)
    column_value = if column[:value] == :id
                     column_for_show? ? link_to(resource.id, resource) : resource.id
                   else
                     resource.send(column[:value])
                   end

    format_money(column_value)
  end

  def column_for_show?
    restful_actions.include? :show
  end

  def column_for_edit?
    restful_actions.include? :edit
  end

  def column_for_destroy?
    restful_actions.include? :destroy
  end

  def format_money(value)
    return value unless value.class == Money

    humanized_money_with_symbol(value)
  end
end
