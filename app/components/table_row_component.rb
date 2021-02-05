class TableRowComponent < ApplicationComponent
  def initialize(resource:, columns:, restful_actions: [])
    @resource = resource
    @columns = columns
    @restful_actions = restful_actions

    super
  end

  private

  attr_reader :resource, :columns, :restful_actions

  def cell_value(resource, column)
    column_value = if id_column?(column)
                     if column_for_show?
                       link_to resource.id, resource
                     else
                       resource.id
                     end
                   else
                     resource.send(column[:value])
                   end

    format_money(column_value)
  end

  def id_column?(column)
    column[:value] == :id
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
    return value unless value.instance_of?(Money)

    humanized_money_with_symbol(value)
  end
end
