require 'test_helper'

module ProductFields
  class PieceComponent < ViewComponent::TestCase
    test 'renders correct fields for piece' do
      component_options = { resource: Item.new, f: simple_form_for(Item.new) }
      render_inline(PieceComponent.new(Item.new, component_options))
    end
  end
end
