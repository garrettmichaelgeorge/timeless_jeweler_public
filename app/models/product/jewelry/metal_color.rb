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
      # This is a lookup class
      self.table_name = 'metal_colors'

      ALLOWED_VALUES = ['White', 'Yellow', 'Rose', 'N/A'].freeze

      # Associations
      has_many :metals, class_name: 'Product::Jewelry::Metal'

      # Validations
      validates :name, presence: true,
                       uniqueness: true,
                       length: { maximum: 10 },
                       inclusion: { in: ALLOWED_VALUES }
    end
  end
end
