# frozen_string_literal: true

class Buttons::RemoveNestedFieldComponent < ApplicationComponent
  # Button to remove nested form fields using the Stimulus
  # controller nestedFormController

  # Make sure to include a _destroy field in the form so the record tied to the
  # deleted field is actually destroyed, i.e.
  # <%= f.hidden_field :_destroy %>
  def initialize(css_class: default_css_class)
    @css_class = css_class

    super
  end

  def call
    link_to '#', data: data, class: css_class do
      icon :trash
    end
  end

  private

  attr_reader :css_class

  def data
    { action: 'nested-form#remove' }
  end

  def default_css_class
    'btn btn-sm btn-danger'
  end
end
