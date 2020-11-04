# == Schema Information
#
# Table name: loose_gemstones
#
#  gemstone_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_id  (gemstone_id)
#  index_loose_gemstones_on_product_id   (product_id)
#

class Product
  class GemstoneProduct < ApplicationRecord
    self.table_name = 'loose_gemstones'

    include Salable

    belongs_to :gemstone, inverse_of: :gemstone_product
  end
end
