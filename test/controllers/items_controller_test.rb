require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    user = FactoryBot.build(:user)
    sign_in user
  end

  context 'routes' do
    should route(:get, '/items').to('items#index')
    should route(:get, '/items/1').to('items#show', id: 1)
    should route(:get, '/items/new').to('items#new')
  end
end
