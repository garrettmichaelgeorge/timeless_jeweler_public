
# frozen_string_literal: true

class CategorySelectorReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)

  include Intakable

  def perform
    @category = element.value
    @item.category = @category

    morph '#intake-form-wrapper', render_intake_form_for(build_item(category: @category))
  end

  private

  def render_intake_form_for(item)
    render IntakeFormComponent.new(item: item, auth_token: @auth_token)
  end
end
