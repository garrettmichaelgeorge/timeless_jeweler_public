# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string
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
      ALLOWED_VALUES = %w[9K
                          10K
                          14K
                          18K
                          22K
                          0.800
                          0.900
                          0.925
                          0.950
                          0.999
                          GF ].freeze

      context 'associations' do
        should have_many(:metals)
      end

      context 'validations' do
        should validate_presence_of(:value)
        should validate_uniqueness_of(:value)
        should validate_length_of(:value).is_at_most(5)
        should validate_inclusion_of(:value)
          .in_array(ALLOWED_VALUES)
      end
    end
  end
end
