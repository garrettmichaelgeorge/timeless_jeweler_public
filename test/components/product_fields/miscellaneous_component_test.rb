require 'test_helper'

class ProductFields::MiscellaneousComponentTest < ViewComponent::TestCase
  def setup
    @item = Item.new
  end

  test 'renders correct fields' do
    simple_form_for @item do |f|
      render_inline ProductFields::MiscellaneousComponent.new(f: f)
    end

    assert_selector('Handbag')
  end
end
