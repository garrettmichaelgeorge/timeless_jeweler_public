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

class Product
  class JewelryPiece < ApplicationRecord
    has_many :gemstones, through: :mountings
  end
end
