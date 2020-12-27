# frozen_string_literal: true

class IntakeReflex < ApplicationReflex
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)

  delegate :current_user, to: :connection

  def change_category
    category = element.value.underscore
    morph '#form-wrapper', render_intake_form_for(build_item_as(category))
  end

  private

  def build_item_as(category)
    Item.build_as(category)
  end

  def render_intake_form_for(item)
    render intake_form_for(item)
  end

  def intake_form_for(item)
    IntakeFormSwitcherComponent.new(item: item)
  end
end
