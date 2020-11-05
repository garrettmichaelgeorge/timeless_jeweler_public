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
end
