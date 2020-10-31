require 'test_helper'

class IntakeFlowTest < ActionDispatch::IntegrationTest
  test 'creates a ring with two diamonds' do
    visit new_product_path
  end
end
