# == Schema Information
#
# Table name: gemstones
#
#  id                   :bigint           not null, primary key
#  carat                :decimal(, )
#  role                 :string(20)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstones_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#
class Gemstone
  class Listed < Gemstone
    has_one :listing, inverse_of: :gemstone,
                      class_name: 'LooseGemstone::Profile',
                      foreign_key: 'gemstone_profile_id'
    def listed? = true
  end
end
