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

class GemstoneSubcategory < ApplicationRecord
  belongs_to :category, class_name: 'GemstoneCategory',
                        inverse_of: :subcategories

  # has_many :gemstones, inverse_of: :subcategory

  validates :name, presence: true,
                   length: { maximum: 40 }
end
