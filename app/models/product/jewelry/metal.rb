# == Schema Information
#
# Table name: metals
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metals_on_name  (name) UNIQUE
#
class Product::Jewelry::Metal < ApplicationRecord
  # Reference table for metals
  def self.table_name
    'metals'
  end

  # Associations
  has_and_belongs_to_many :jewelry_products, class_name: 'Product::JewelryProduct',
                                             association_foreign_key: 'jewelry_piece_id'

  # Validations
  validates :name, presence: true,
                   uniqueness: true
end
