# == Schema Information
#
# Table name: gemstones
#
#  id         :bigint           not null, primary key
#  carat      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class GemstoneTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:mounting)
    should have_one(:gemstone_product)
    should_eventually belong_to(:subcategory)
    should_eventually have_one(:diamond_color).through(:color_grade)
    should_eventually have_one(:diamond_cut).through(:cut_grade)
    should_eventually have_one(:diamond_clarity).through(:clarity_grade)
  end

  context 'validations' do
    should validate_numericality_of(:carat)
  end

  context 'attributes' do
    should respond_to?(:carat)
  end
end
