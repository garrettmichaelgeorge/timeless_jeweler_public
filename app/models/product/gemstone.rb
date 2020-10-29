# == Schema Information
#
# Table name: gemstones
#
#  id                      :bigint           not null, primary key
#  carat                   :decimal(5, 2)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  gemstone_subcategory_id :bigint           not null
#
# Indexes
#
#  index_gemstones_on_gemstone_subcategory_id  (gemstone_subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_subcategory_id => gemstone_subcategories.id)
#
class Product
  class Gemstone < ApplicationRecord
    self.table_name = 'gemstones'
    belongs_to :subcategory, class_name: 'Product::Gemstone::Subcategory',
                             foreign_key: 'gemstone_subcategory_id'
    has_one :mounted_gemstone
    has_one :gemstone_product, class_name: 'Product::GemstoneProduct'
    validates_numericality_of :carat
  end
end
