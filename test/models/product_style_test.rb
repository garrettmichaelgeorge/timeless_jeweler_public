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

class ProductStyleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
