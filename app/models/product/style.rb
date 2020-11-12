# == Schema Information
#
# Table name: product_styles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_styles_on_name  (name) UNIQUE
#
class Product
  class Style < ApplicationRecord
    self.table_name = 'product_styles'

    has_many :products, inverse_of: :style

    # Validations
    validates :name, presence: true,
                     length: { maximum: 40 },
                     uniqueness: true
  end
end
