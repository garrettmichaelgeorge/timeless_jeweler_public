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

class Product::Jewelry::MetalColorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
