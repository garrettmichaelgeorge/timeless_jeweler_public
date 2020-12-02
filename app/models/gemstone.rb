# == Schema Information
#
# Table name: gemstones
#
#  id         :bigint           not null, primary key
#  carat      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gemstone < ApplicationRecord
  include Salable
  # Associations
  has_one :mounting, inverse_of: :gemstone

  has_one :gemstone_product, inverse_of: :gemstone

  # Validations
  validates_numericality_of :carat
end
