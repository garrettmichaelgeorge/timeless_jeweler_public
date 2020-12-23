require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    user = FactoryBot.build(:user)
    sign_in user
  end

  describe 'GET #index' do
    it 'responds with 200' do
      get items_path
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'responds with 200' do
      get item_path(1)
      assert_response :success
    end
  end

  describe 'GET #new' do
    it 'responds with 200' do
      get new_item_path
      assert_response :success
    end
  end

  describe 'GET #edit' do
    it 'responds with 200' do
      get edit_item_path(1)
      assert_response :success
    end
  end
end
