require 'test_helper'

class IntakeFormSubtypeFieldsComponentTest < ViewComponent::TestCase
  should('render something') do
    render_inline(IntakeFormSubtypeFieldsComponent.new(resource: Object.new, f: simple_form_for(Object.new)))
    page.must_have_text('Hello, world!')
  end
end
