# == Schema Information
#
# Table name: miscellaneous_item_subcategories
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class MiscellaneousItem
  class SubcategoryTest < ActiveSupport::TestCase
    context 'associations' do
      should have_many(:miscellaneous_items)
    end
  end
end
