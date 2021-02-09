# frozen_string_literal: true

class IntakeReflex < ApplicationReflex
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)

  include Formable

  def change_category
    category = element.value

    morph '#intake-form-wrapper',
          render_intake_form_for(build_item(category))
  end

  private

  def render_intake_form_for(item)
    render IntakeFormComponent.new(item: item, auth_token: @auth_token)
  end

  def build_item(category)
    Items::Creator.new(context: self,
                       attrs: { category: category })
                  .item
  end
end
