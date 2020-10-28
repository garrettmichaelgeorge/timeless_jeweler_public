# == Schema Information
#
# Table name: gemstone_subcategories
#
#  id                   :bigint           not null, primary key
#  name                 :string(40)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstone_subcategories_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#

class Product
  class Gemstone
    class Subcategory < ApplicationRecord
      belongs_to :category, class_name: 'Gemstone::Category',
                            inverse_of: :subcategories,
                            foreign_key: 'gemstone_category_id'

      has_many :gemstones, inverse_of: :subcategories

      validates_presence_of :name
      validates_length_of :name, maximum: 40
    end
  end
end
