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
      self.table_name = 'mountings'

      belongs_to :profile,         class_name: 'Product::Gemstone::Profile',
                                   foreign_key: 'gemstone_id'

      belongs_to :jewelry_product, class_name: 'Product::JewelryProduct',
                                   foreign_key: 'jewelry_piece_id'

      # Delegations
      delegate_missing_to :profile
    end
  end
end
