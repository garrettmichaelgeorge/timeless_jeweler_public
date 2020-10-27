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
  should have_many(:subcategories)
  should validate_presence_of(:name)
  should validate_length_of(:name)
end
