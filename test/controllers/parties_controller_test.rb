require 'test_helper'

class PartiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @party       = parties(:clara)
    @other_party = parties(:robert)
  end
end
