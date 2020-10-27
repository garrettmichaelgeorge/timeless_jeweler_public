require 'test_helper'

class MountingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:gemstone)
    should belong_to(:jewelry_piece)
  end
end
