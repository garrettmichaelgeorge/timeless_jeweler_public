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

class Metal
  class Purity < ApplicationRecord
    ALLOWED_VALUES = I18n.t('metal_purities', scope: :lookup).freeze

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
end
