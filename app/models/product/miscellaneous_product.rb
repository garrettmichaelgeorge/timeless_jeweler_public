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

class Product
  class MiscellaneousProduct < ApplicationRecord
    # Product subtype. Catch-all for handbags, etc. that aren't jewelry-related but are still sold in the store
    self.table_name = 'miscellaneous_products'

    include Salable
  end
end
