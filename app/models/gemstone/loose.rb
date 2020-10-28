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
class Gemstone::Loose < ApplicationRecord
  belongs_to :gemstone, inverse_of: :loose_gemstone
  belongs_to :product
end
