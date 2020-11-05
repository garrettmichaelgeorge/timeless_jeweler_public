# == Schema Information
#
# Table name: product_eras
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_eras_on_name  (name) UNIQUE
#
class Product
  class Era < ApplicationRecord
  end
end
