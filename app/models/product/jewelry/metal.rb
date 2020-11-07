# == Schema Information
#
# Table name: metals
#
#  id                :bigint           not null, primary key
#  name              :string(40)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  jewelry_piece_id  :bigint           not null
#  metal_category_id :bigint           not null
#
# Indexes
#
#  index_metals_on_jewelry_piece_id   (jewelry_piece_id)
#  index_metals_on_metal_category_id  (metal_category_id)
#  index_metals_on_name               (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (jewelry_piece_id => jewelry_pieces.id)
#  fk_rails_...  (metal_category_id => metal_categories.id)
#

class Product
  module Jewelry
    class Metal < ApplicationRecord
      def self.table_name
        'metals'
      end

      # Associations
      belongs_to :jewelry_product, class_name: 'Product::JewelryProduct',
                                   foreign_key: 'jewelry_piece_id'

      #-- Metals
      belongs_to :category, class_name: 'Product::Jewelry::MetalCategory',
                            foreign_key: 'metal_category_id'

      belongs_to :color,    class_name: 'Product::Jewelry::MetalColor',
                            foreign_key: 'metal_color_id'

      belongs_to :purity,   class_name: 'Product::Jewelry::MetalPurity',
                            foreign_key: 'metal_purity_id'
    end
  end
end
