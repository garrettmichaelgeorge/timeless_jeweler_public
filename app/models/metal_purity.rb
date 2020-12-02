# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_purities_on_value  (value) UNIQUE
#

class MetalPurity < ApplicationRecord
  ALLOWED_VALUES = %w[9K
                      10K
                      14K
                      18K
                      22K
                      0.800
                      0.900
                      0.925
                      0.950
                      0.999
                      GF
                      Unknown].freeze

  # Associations
  has_many :metals, inverse_of: :purity

  # Validations
  validates :value, presence: true,
                    uniqueness: true,
                    length: { maximum: 10 },
                    inclusion: { in: ALLOWED_VALUES }

  # Aliases
  alias_attribute :name, :value
end
