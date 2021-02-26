
# frozen_string_literal: true

class CategorySelectorReflex < ApplicationReflex
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
