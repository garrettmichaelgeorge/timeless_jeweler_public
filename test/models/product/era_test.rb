# == Schema Information
#
# Table name: product_eras
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_eras_on_name  (name) UNIQUE
#
require 'test_helper'

class Product
  class EraTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
  end
end
