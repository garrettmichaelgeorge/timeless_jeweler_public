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

  ROLES = %w[Loose Mounted].freeze

  scope :loose,   -> { where(role: 'Loose') }
  scope :mounted, -> { where(role: 'Mounted') }

  has_one :loose_gemstone,   inverse_of: :profile
  has_one :mounted_gemstone, inverse_of: :profile

  validates :role, presence: true, length: { maximum: 20 }, inclusion: ROLES
end
