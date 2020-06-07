class TableIndexComponent < ApplicationComponent
  include StoreTransactionsHelper

  # TODO: add the ability to make any given column values link elsewhere in the app
  attr_reader :title, :columns, :resources, :restful_actions, :labels

  def initialize(title:, columns:, resources:, restful_actions: [])
    @title = title
    @columns = columns
    @resources = resources
    @restful_actions = restful_actions

    set_up_columns

    @labels = extract_labels(@columns)
  end

  def before_render
    # @columns.map! { |column| format_money(column) }
  end

  def render_columns
    html = @columns.each_with_index do |column, index|
      "%td{class: list_js_values[index]}= render_column(resource, column)"
    end
  end

  def render_column(resource, column)
    # To access nested associations via a chain of method calls, send the column key as an array of symbolized methods in their call order 
    # e.g. { :columns => { [:specific, :first_name] => "First Name" }
    # => @party.specific.first_name
    # column_value = column[:attribute].inject(resource, :send)
    if column[:attribute] == :id
      column_value = column_for_show? ? link_to(resource.id, resource) : resource.id
    else
      column_value = resource.send(column[:attribute])
    end
    format_money(column_value)
  end

  # Check methods

  def link?
    self.key?(:link)
  end

  def money?
    self.class == Money
  end

  # returns array with values for List.js columns
  def list_js_values
    @columns.each { |column| column[:attribute].to_s.camelize(:lower) }
  end

  # list_values expected output
  # data-list='{"valueNames": ["orders-order", "orders-product", "orders-date", "orders-total", "orders-status", "orders-method"]}'
  # list_values actual output
  # data-list="{'valueNames': [&quot;id&quot;, &quot;title&quot;, &quot;firstName&quot;, &quot;lastName&quot;, &quot;suffix&quot;, &quot;ringSize&quot;, &quot;necklaceLength&quot;, &quot;birthday&quot;]}"

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


  private

  def format_money(value)
    if value.class == Money
      puts "\n\t#{value} is a Money value!"
      humanized_money_with_symbol(value)
    else
      puts "\n\t#{value} is not a Money value..."
      value
    end
  end

  # Setup methods
  def set_up_columns
    default_labels
  end

  def default_labels
    # Give each column hash a default label if it doesn't include one
    columns.each do |column|
      stringified_attribute = column[:attribute].to_s.capitalize.gsub(/_/, ' ')
      column.store(:label, stringified_attribute) unless column.key?(:label)
    end
  end

  def extract_labels(columns)
    columns.map { |column| column[:label] }
  end
end
