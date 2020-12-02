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

class MetalCategory < ApplicationRecord
  # This is a lookup class
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
  has_many :metals, inverse_of: :category

  # Validations
  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 20 },
                   inclusion: { in: ALLOWED_VALUES }
end
