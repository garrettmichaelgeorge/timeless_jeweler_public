# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string(4)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_purities_on_value  (value) UNIQUE
#
require 'test_helper'

class Product
  module Jewelry
    class MetalPurityTest < ActiveSupport::TestCase
      context 'associations' do
        should have_and_belong_to_many(:jewelry_products)
      end

      context 'validations' do
        should validate_presence_of(:value)
        should validate_uniqueness_of(:value)
        should validate_length_of(:value).is_at_most(4)
      end
    end
  end
end
