require 'test_helper'

module IntakeForm
  class JewelryFieldsComponentTest < ViewComponent::TestCase
    test 'renders correct fields for jewelry product' do
      component_options = { resource: Product.new, f: simple_form_for(Product.new) }
      render_inline(JewelryFieldsComponent.new(Product.new, component_options))
    end
  end
end
