require 'test_helper'

class IntakeFormComponentTest < ViewComponent::TestCase
  test 'renders correct fields for basic product' do
    render_inline(IntakeFormComponent.new(resource: Product.new))

    assert_field('Name',            type: 'text')
    assert_field('Description',     type: 'textarea')
    assert_field('Cost',            type: 'number')
    assert_field('Price',           type: 'number')
    assert_field('Notes',           type: 'textarea')
    assert_field('Category',        type: 'select')
    assert_field('Style',           type: 'select')
  end

  test 'renders gemstone fields for gemstone products' do
    category = FactoryBot.build(:product_category_gemstone)
    render_inline(IntakeFormComponent.new(resource: Product.new(category: category)))
    assert_text('Diamond')
  end

  test 'renders jewelry fields for jewelry products' do
    category = FactoryBot.build(:product_category_jewelry)
    render_inline(IntakeFormComponent.new(resource: Product.new(category: category)))
  end

  test 'renders miscellaneous fields for miscellaneous products' do
    category = FactoryBot.build(:product_category_miscellaneous)
    render_inline(IntakeFormComponent.new(resource: Product.new(category: category)))
  end

  test 'fails when new product object is not passed' do
    assert_raises(ArgumentError) do
      render_inline(IntakeFormComponent.new)
    end
  end
end
