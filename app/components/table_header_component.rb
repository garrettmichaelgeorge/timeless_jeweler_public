class TableHeaderComponent < ApplicationComponent
  def initialize(resources:, columns:, restful_actions:)
    @resources = resources
    @columns = default_labels_for(columns)
    @restful_actions = restful_actions
  end

  private

  attr_reader :resources, :columns, :restful_actions

  def colspan
    edit_and_destroy_only.count
  end

  def edit_and_destroy_only
    restful_actions.reject { |item| item == :show }
  end

  # Setup
  def default_labels_for(columns)
    # Give each column hash a default label if one wasn't provided in the parameters
    columns.each do |column|
      unless column.key? :label
        stringified_value = column[:value].to_s.capitalize.gsub(/_/, ' ')
        column.store(:label, stringified_value)
      end
    end
  end

  def labels_from(columns)
    columns.map { |column| column[:label] }
  end
end
