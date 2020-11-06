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
  class JewelryProduct < ApplicationRecord
    self.table_name = 'jewelry_pieces'

    include Salable

    # Associations
    has_many :mounted_gemstones, class_name: 'Product::Gemstone::MountedGemstone',
                                 inverse_of: :jewelry_product

    has_many :gemstones, through: :mounted_gemstones

    has_and_belongs_to_many :metals, class_name: 'Product::Jewelry::Metal',
                                     foreign_key: 'jewelry_piece_id'

    has_and_belongs_to_many :metal_colors, class_name: 'Product::Jewelry::MetalColor',
                                           foreign_key: 'jewelry_piece_id'

    has_and_belongs_to_many :metal_purities, class_name: 'Product::Jewelry::MetalColor',
                                             foreign_key: 'jewelry_piece_id'
  end
end
