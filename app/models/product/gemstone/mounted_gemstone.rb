# == Schema Information
#
# Table name: mountings
#
#  gemstone_id      :bigint           not null
#  jewelry_piece_id :bigint           not null
#
# Indexes
#
#  index_mountings_on_gemstone_id       (gemstone_id)
#  index_mountings_on_jewelry_piece_id  (jewelry_piece_id)
#

class Product
  class Gemstone
    class MountedGemstone < ApplicationRecord
      # Serves two roles:
      # 1. as one of two subtypes of Gemstone
      # 2. as a join table between Gemstone and Jewelry Product

      self.table_name = 'mountings'
      belongs_to :gemstone,         class_name: 'Product::Gemstone'
      belongs_to :jewelry_product,  class_name: 'Product::JewelryProduct',
                                    foreign_key: 'jewelry_piece_id'
    end
  end
end
