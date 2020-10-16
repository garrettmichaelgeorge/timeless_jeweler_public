class TableCheckboxComponent < ApplicationComponent
  attr_reader :id, :resource

  def initialize(id:, resource:)
    @id = id.to_s
    @resource = resource
  end

  def input_name
    "#{resource}Select"
  end

  def input_id
    "#{resource}Select#{id.capitalize}"
  end

  def input_class
    result = [
      type.to_s,
      'custom-control-input'
    ]
    result.join(' ')
  end

  private

  def type
    all? ? 'list-check-box-all' : 'list-check-box'
  end

  def all?
    id == 'all'
  end
end
