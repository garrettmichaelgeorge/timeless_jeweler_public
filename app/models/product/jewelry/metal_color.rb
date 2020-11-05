# == Schema Information
#
# Table name: metal_colors
#
#  id         :bigint           not null, primary key
#  name       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_colors_on_name  (name) UNIQUE
#
class Product
  module Jewelry
    class MetalColor < ApplicationRecord
      def self.table_name
        'metal_colors'
      end

      # Associations
      has_and_belongs_to_many :jewelry_products, class_name: 'Product::JewelryProduct',
                                                 association_foreign_key: 'jewelry_piece_id'

      # Validations
      validates :name, presence: true,
                       uniqueness: true,
                       length: { maximum: 10 }
    end
  end
end
