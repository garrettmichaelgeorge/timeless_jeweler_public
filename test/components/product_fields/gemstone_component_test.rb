require 'test_helper'

class ProductFields::GemstoneComponentTest < ViewComponent::TestCase
  test 'renders correct fields' do
    render_inline(ProductFields::GemstoneComponent.new(resource: Item.new, f: ''))

    # assert_field('Diamond Grade', type: 'Select')
    assert_field('Carat', type: 'Input')
  end
end
