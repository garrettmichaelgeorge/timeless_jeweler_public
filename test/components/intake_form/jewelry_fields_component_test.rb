require 'test_helper'

module IntakeForm
  class JewelryFieldsComponentTest < ViewComponent::TestCase
    test 'renders correct fields for jewelry product' do
      component_options = { resource: Product.new, intake_form: simple_form_for(Product.new) }
      render_inline(JewelryFieldsComponent.new(resource: Product.new))
    end
  end
end
