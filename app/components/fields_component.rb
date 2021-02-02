# frozen_string_literal: true

class FieldsComponent < ApplicationComponent
  def initialize(f:)
    @f = f
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
