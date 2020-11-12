# == Schema Information
#
# Table name: product_styles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_styles_on_name  (name) UNIQUE
#
require 'test_helper'

class Product
  class StyleTest < ActiveSupport::TestCase
    context 'associations' do
      should have_many(:products)
    end

    context 'validations' do
      subject { FactoryBot.build(:product_style) }
      should validate_length_of(:name).is_at_most(40)
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
    end
  end
end
