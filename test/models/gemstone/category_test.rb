# == Schema Information
#
# Table name: gemstone_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Gemstone::CategoryTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:gemstones).inverse_of(:subcategory)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
  end
end
