# == Schema Information
#
# Table name: gemstone_profiles
#
#  id         :bigint           not null, primary key
#  carat      :decimal(, )
#  role       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gemstone < ApplicationRecord
  self.table_name = 'gemstone_profiles'

  self.inheritance_column = 'role'

  ROLES = %w[Loose Mounted].freeze

  scope :loose,   -> { where(role: 'Loose') }
  scope :mounted, -> { where(role: 'Mounted') }

  validates :role, presence: true, length: { maximum: 20 },
                   inclusion: ROLES

  class Listing < Gemstone
    has_one :loose_gemstone, inverse_of: :gemstone,
                             class_name: 'LooseGemstoneProfile'
  end

  class Mounting < Gemstone
    has_one :mounted_gemstone, inverse_of: :profile
  end
end
