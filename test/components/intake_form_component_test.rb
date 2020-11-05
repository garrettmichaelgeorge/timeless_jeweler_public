require 'test_helper'

class IntakeFormComponentTest < ViewComponent::TestCase
  context 'form fields' do
    setup do
      render_inline(IntakeFormComponent.new(resource: Product.new))
    end

    should('have name field')                        { page.must_have_field('Name',          type: 'text') }
    should('have description field')                 { page.must_have_field('Description',   type: 'textarea') }
    should('have cost field')                        { page.must_have_field('Cost',          type: 'number') }
    should('have price field')                       { page.must_have_field('Price',         type: 'number') }
    should('have notes field')                       { page.must_have_field('Notes',         type: 'textarea') }
    should('have radio button for Jewelry')          { page.must_have_field('Jewelry',       type: 'radio') }
    should('have radio button for Gemstone')         { page.must_have_field('Gemstone',      type: 'radio') }
    should('have radio button for Miscellaneous')    { page.must_have_field('Miscellaneous', type: 'radio') }
    should('have style field')                       { page.must_have_field('Style',         type: 'select') }
    should('have source field')                      { page.must_have_field('Style',         type: 'select') }
    should('have era field')                         { page.must_have_field('Era',           type: 'select') }
    should('not have iRrElLeVaNt field')             { page.wont_have_field('NONSENSE') }

    context 'jewelry fields' do
      setup do
        render_inline(IntakeFormComponent.new(resource: Product.new))
        # page.choose('Jewelry')
      end

      should('have metal field')                     { page.must_have_field('Metal',         type: 'select') }
      should('have purity field')                    { page.must_have_field('Purity',        type: 'select') }
      should('have color field')                     { page.must_have_field('Color',         type: 'select') }
      should('have jewelry category field')          { page.must_have_field('Jewelry Category', type: 'select') }
      should('have add mounted gemstone button')     { page.must_have_button('Add mounted gemstone') }
    end

    context 'gemstone fields' do
      setup do
        render_inline(IntakeFormComponent.new(resource: Product.new))
        # page.choose('Gemstone')
      end

      should('have carat field')                     { page.must_have_field('Carat',           type: 'number') }
      should('have diamond color field')             { page.must_have_field('Diamond Color',   type: 'select') }
      should('have diamond cut field')               { page.must_have_field('Diamond Cut',     type: 'select') }
      should('have diamond clarity field')           { page.must_have_field('Diamond Clarity', type: 'select') }
      should_eventually('have gemstone report field')
      should_eventually('have gemstone lab field')
    end

    context 'miscellaneous fields' do
      setup do
        render_inline(IntakeFormComponent.new(resource: Product.new))
        # page.choose('Miscellaneous')
      end

      should('have miscellaneous category field') { page.must_have_field('Miscellaneous Category', type: 'select') }
    end
  end

  should 'fail when new product object is not passed' do
    assert_raises(ArgumentError) { render_inline(IntakeFormComponent.new) }
  end
end
