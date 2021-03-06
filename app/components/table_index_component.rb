class TableIndexComponent < ApplicationComponent
  # TODO: add option for links on any given column

  delegate :category_name_capitalized, to: :helpers

  def initialize(resources:, title:, columns:, restful_actions: [])
    @resources = resources
    @title = title
    @columns = Columns.new(columns)
    @restful_actions = restful_actions
  end

  # returns array with values for List.js columns
  def list_js_values
    # expected output:
    # data-list='{"valueNames": ["orders-order", "orders-product", "orders-date", "orders-total", "orders-status", "orders-method"]}'
    # actual output:
    # data-list="{'valueNames': [&quot;id&quot;, &quot;title&quot;, &quot;firstName&quot;, &quot;lastName&quot;, &quot;suffix&quot;, &quot;ringSize&quot;, &quot;necklaceLength&quot;, &quot;birthday&quot;]}"
    columns.map { |column| column[:value].to_s.camelize(:lower) }
  end

  protected

  def column_for_show?
    restful_actions.include? :show
  end

  def column_for_edit?
    restful_actions.include? :edit
  end

  def column_for_destroy?
    restful_actions.include? :destroy
  end

  private

  attr_reader :title, :columns, :resources, :restful_actions

  class Columns
    include Enumerable

    attr_reader :columns

    def initialize(columns)
      @columns = columns
    end

    def each(&block)
      columns.each(&block)
    end

    def labels
      @columns.map { |column| label_from(column) }
    end

    private

    def label_from(column)
      column.fetch(:label) { default_label_for(column) }
    end

    def default_label_for(column)
      label = column.fetch(:value) { "" }
      label.to_s.capitalize.gsub(/_/, ' ')
    end
  end
end
