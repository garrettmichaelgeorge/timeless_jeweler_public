# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string
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
      # This is a lookup table
      self.table_name = 'metal_purities'

      ALLOWED_VALUES = %w[9K
                          10K
                          14K
                          18K
                          22K
                          0.800
                          0.900
                          0.925
                          0.950
                          0.999
                          GF ].freeze
      # Associations
      has_many :metals, class_name: 'Product::Jewelry::Metal'

      # Validations
      validates :value, presence: true,
                        uniqueness: true,
                        length: { maximum: 5 },
                        inclusion: { in: ALLOWED_VALUES }

      # Aliases
      alias_attribute :name, :value
    end
  end
end
