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
require 'test_helper'

class Product
  class MiscellaneousProductTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:product)
        .conditions(category: 'MISCELLANEOUS')
    end
  end
end