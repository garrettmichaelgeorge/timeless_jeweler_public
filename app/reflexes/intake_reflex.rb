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
    item ||= Item.build_as(category)

    morph '#new_item', render(IntakeFormSwitcherComponent.new(item: item))
  end
end
