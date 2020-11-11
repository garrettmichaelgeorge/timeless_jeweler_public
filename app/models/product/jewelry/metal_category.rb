# == Schema Information
#
# Table name: metal_categories
#
#  id         :bigint           not null, primary key
#  name       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_categories_on_name  (name) UNIQUE
#

class Product
  module Jewelry
    class MetalCategory < ApplicationRecord
      # This is a lookup class
      self.table_name = 'metal_categories'

      ALLOWED_VALUES = ['Aluminum',
                        'Brass',
                        'Bronze',
                        'Copper',
                        'Copper Plate',
                        'Gold',
                        'Iron',
                        'Platinum',
                        'Silver',
                        'Sterling Silver',
                        'Fine Silver',
                        'Mexican Silver',
                        'Silver Plate',
                        'Steel',
                        'Stainless Steel',
                        'Titanium',
                        'Unknown'].freeze

      # Associations
      has_many :metals, class_name: 'Product::Jewelry::Metal',
                        foreign_key: 'metal_id',
                        inverse_of: :category

      # Validations
      validates :name, presence: true,
                       uniqueness: true,
                       length: { maximum: 20 },
                       inclusion: { in: ALLOWED_VALUES }
    end
  end
end
