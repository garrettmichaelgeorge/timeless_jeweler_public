# == Schema Information
#
# Table name: metal_colors
#
#  id         :bigint           not null, primary key
#  name       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_colors_on_name  (name) UNIQUE
#
require 'test_helper'

class Product
  module Jewelry
    class MetalColorTest < ActiveSupport::TestCase
      context 'associations' do
        should have_and_belong_to_many(:jewelry_products)
      end

      context 'validations' do
        should validate_presence_of(:name)
        should validate_uniqueness_of(:name)
        should validate_length_of(:name).is_at_most(10)
      end
    end
  end
end
