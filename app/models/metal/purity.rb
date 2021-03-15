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
    include Lookupable

    # Associations
    has_many :metals, inverse_of: :purity

    # Validations
    lookup_attribute :value, maximum_length: 10

    # Aliases
    alias_attribute :name, :value
  end
end
