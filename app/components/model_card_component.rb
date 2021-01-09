# frozen_string_literal: true

class ModelCardComponent < ApplicationComponent
  def initialize(model:, attrs:)
    @model = model
    @attrs = set_up_attrs(attrs)
  end

  private

  attr_reader :model, :attrs

  def set_up_attrs(attrs)
    attrs.to_h { |attr| set_up_attr(attr) }
  end

  def set_up_attr(attr)
    [attr, model.public_send(attr)]
  end

  def card_options
    { inactive: inactive? }
  end

  def inactive?
    model.nil?
  end
end
