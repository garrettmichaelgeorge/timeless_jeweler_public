require 'test_helper'

class IntakeFormComponentTest < ViewComponent::TestCase
  context 'renders correct fields for basic product' do
    # setup do
    #   render_inline(IntakeFormComponent.new(resource: Product.new))
    # end
    # subject { render_inline(IntakeFormComponent.new(resource: Product.new)) }
    setup do
      render_inline(IntakeFormComponent.new(resource: Product.new))
    end

    should('have name field')           { page.has_field?('Name',        type: 'text') }
    should('have description field')    { page.has_field?('Description', type: 'textarea') }
    should('have cost field')           { page.has_field?('Cost',        type: 'number') }
    should('have price field')          { page.has_field?('Price',       type: 'number') }
    should('have notes field')          { page.has_field?('Notes',       type: 'textarea') }
    should('have category field')       { page.has_field?('Category',    type: 'select') }
    should('have style field')          { page.has_field?('Style',       type: 'select') }
    should('not have iRrElLeVaNt field') { page.has_no_field?('iRrElLeVaNt', type: 'select') }
  end

  test 'renders jewelry fields for jewelry products' do
    render_inline(IntakeFormComponent.new(resource: Product.new(category: 'JEWELRY')))
  end

  test 'renders gemstone fields for gemstone products' do
    render_inline(IntakeFormComponent.new(resource: Product.new(category: 'GEMSTONE')))
  end

  test 'renders miscellaneous fields for miscellaneous products' do
    render_inline(IntakeFormComponent.new(resource: Product.new(category: 'MISCELLANEOUS')))
  end

  test 'fails when new product object is not passed' do
    assert_raises(ArgumentError) do
      render_inline(IntakeFormComponent.new)
    end
  end
end
