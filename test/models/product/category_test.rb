# == Schema Information
#
# Table name: product_categories
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Product
  class CategoryTest < ActiveSupport::TestCase
    context 'associations' do
      should have_many(:products)
    end

    context 'validations' do
      PRODUCT_CATEGORIES = %w[GEMSTONE JEWELRY MISCELLANEOUS].freeze
      should validate_inclusion_of(:name)
        .in_array(PRODUCT_CATEGORIES)
    end
  end
end
