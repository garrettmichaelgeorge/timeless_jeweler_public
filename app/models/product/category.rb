# == Schema Information
#
# Table name: product_categories
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product
  class Category < ApplicationRecord
    # Gives options for product subtype, which are then validated for
    # exclusivity via check constraints in the subtype tables
    # Formerly contained jewelry product categories such as 'ring', 'brooch',
    # 'watch', etc.
    has_many :products, inverse_of: :category

    VALID_PRODUCT_CATEGORIES = %w[GEMSTONE JEWELRY MISCELLANEOUS].freeze
    validates :name, inclusion: { in: VALID_PRODUCT_CATEGORIES }
  end
end
