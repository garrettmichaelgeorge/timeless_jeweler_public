# == Schema Information
#
# Table name: miscellaneous_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class MiscellaneousItemTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:item).polymorphic(true)
  end
end
