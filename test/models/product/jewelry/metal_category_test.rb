# == Schema Information
#
# Table name: metal_categories
#
#  id         :bigint           not null, primary key
#  name       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_categories_on_name  (name) UNIQUE
#
require 'test_helper'

class Product
  module Jewelry
    class MetalCategoryTest < ActiveSupport::TestCase
      # This is a lookup class

      ALLOWED_VALUES = ['Aluminum',
                        'Brass',
                        'Bronze',
                        'Copper',
                        'Copper Plate',
                        'Gold',
                        'Iron',
                        'Platinum',
                        'Silver',
                        'Sterling Silver',
                        'Fine Silver',
                        'Mexican Silver',
                        'Silver Plate',
                        'Steel',
                        'Stainless Steel',
                        'Titanium',
                        'Unknown'].freeze

      context 'associations' do
        should have_many(:metals)
      end

      context 'validations' do
        should validate_presence_of(:name)
        should validate_uniqueness_of(:name)
        should validate_length_of(:name).is_at_most(20)
        should validate_inclusion_of(:name)
          .in_array(ALLOWED_VALUES)
      end
    end
  end
end
