require 'test_helper'

class IntakeForm::GemstoneFieldsComponentTest < ViewComponent::TestCase
  test 'renders correct fields' do
    render_inline(IntakeForm::GemstoneFieldsComponent.new(resource: Product.new, f: ''))

    assert_field('Diamond Grade', type: 'Select')
  end
end
