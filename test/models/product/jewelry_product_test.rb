# == Schema Information
#
# Table name: jewelry_pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_jewelry_pieces_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class Product
  class JewelryProductTest < ActiveSupport::TestCase
    should have_many(:mounted_gemstones)
    should have_many(:gemstones).through(:mounted_gemstones)
  end
end
