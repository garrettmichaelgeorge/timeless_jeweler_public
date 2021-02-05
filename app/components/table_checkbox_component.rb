class TableCheckboxComponent < ApplicationComponent
  attr_reader :id, :resource

  def initialize(id:, resource:)
    @id = id.to_s
    @resource = resource

    super
  end

  def input_name
    "#{resource}Select"
  end

  def input_id
    "#{resource}Select#{id.capitalize}"
  end

  def input_class
    class_names type.to_s, 'form-check-input'
  end

  private

  def type
    all? ? 'list-check-box-all' : 'list-check-box'
  end

  def all?
    id == 'all'
  end
end
