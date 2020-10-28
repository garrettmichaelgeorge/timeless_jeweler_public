# == Schema Information
#
# Table name: gemstone_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product
  class Gemstone
    class Category < ApplicationRecord
      has_many :subcategories, class_name: 'Product::Gemstone::Subcategory',
                               inverse_of: :category,
                               foreign_key: 'gemstone_subcategory_id'

      validates_presence_of :name
      validates_length_of :name, maximum: 40
    end
  end
end
