# == Schema Information
#
# Table name: miscellaneous_products
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_miscellaneous_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Product
  class MiscellaneousProduct < ApplicationRecord
    belongs_to :product
  end
end
