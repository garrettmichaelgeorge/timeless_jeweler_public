# == Schema Information
#
# Table name: gemstone_products
#
#  id                  :bigint           not null, primary key
#  gemstone_profile_id :bigint           not null
#
# Indexes
#
#  index_gemstone_products_on_gemstone_profile_id  (gemstone_profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#

class GemstoneItem < ApplicationRecord
  # Join table between Gemstone and Item
  belongs_to :gemstone, inverse_of: :gemstone_item
  belongs_to :item, inverse_of: :gemstone_item
end
