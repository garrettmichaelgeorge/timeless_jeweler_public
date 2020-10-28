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
    has_many :products, inverse_of: :category
  end
end
