# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string(4)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_purities_on_value  (value) UNIQUE
#
class Product
  module Jewelry
    class MetalPurity < ApplicationRecord
      def self.table_name
        'metal_purities'
      end

      # Associations
      has_and_belongs_to_many :jewelry_products, class_name: 'Product::JewelryProduct',
                                                 association_foreign_key: 'jewelry_piece_id'

      # Validations
      validates :value, presence: true,
                        uniqueness: true,
                        length: { maximum: 4 }

      # Aliases
      alias_attribute :name, :value
    end
  end
end
