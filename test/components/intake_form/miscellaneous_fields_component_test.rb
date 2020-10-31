require 'test_helper'

class IntakeForm::MiscellaneousFieldsComponentTest < ViewComponent::TestCase
  def setup
    @product = Product.new
  end

  test 'renders correct fields' do
    simple_form_for @product do |f|
      render_inline(IntakeForm::MiscellaneousFieldsComponent.new(resource: Product.new,
                                                                 f: f))
    end

    assert_selector('Handbag')
  end
end
