# == Schema Information
#
# Table name: metals
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metals_on_name  (name) UNIQUE
#
require 'test_helper'

class Product::Jewelry::MetalTest < ActiveSupport::TestCase
  context 'associations' do
    should have_and_belong_to_many(:jewelry_products)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should validate_length_of(:name).is_at_most(20)
  end
end
