# == Schema Information
#
# Table name: gemstone_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GemstoneCategory < ApplicationRecord
  self.table_name = 'gemstone_categories'

  has_many :subcategories, class_name: 'GemstoneSubcategory',
                           inverse_of: :category

  validates_presence_of :name
  validates_length_of :name, maximum: 40
end
