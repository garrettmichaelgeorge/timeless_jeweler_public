# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Piece < ApplicationRecord
  include Salable

  # Associations
  has_many :mountings, inverse_of: :piece

  has_many :gemstones, through: :mountings,
                       inverse_of: :piece

  has_many :metals, inverse_of: :piece

  # Delegations
  delegate :category,
           :color,
           :purity,
           to: :metals,
           prefix: true
end
