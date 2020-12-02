require 'test_helper'

class ProductFields::MetalComponentTest < ViewComponent::TestCase
  context 'renders correct fields' do
    setup do
      simple_form_for(Product.new) do |f|
        render_inline(ProductFields::MetalComponent.new(f: f))
      end
      # page.choose('Jewelry')
    end

    should('have field for color')    { page.must_have_field('Metal category', type: 'select') }
    should('have field for category') { page.must_have_field('Metal color',    type: 'select') }
    should('have field for purity')   { page.must_have_field('Metal purity',   type: 'select') }
  end
end
