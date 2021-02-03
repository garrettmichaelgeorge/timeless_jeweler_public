# frozen_string_literal: true

class FieldsComponent < ApplicationComponent
  delegate :new_record?, to: :form_object, allow_nil: true

  def initialize(f:)
    @f = f

    super
  end

  def render?
    !form_object.nil?
  end

  private

  attr_reader :f

  def form_object
    f.object
  end
end
