# == Schema Information
#
# Table name: diamond_colors
#
#  id         :bigint           not null, primary key
#  grade      :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DiamondColor < ApplicationRecord
  # Lookup class
  validates :grade, presence: true,
                    uniqueness: true,
                    length: { maximum: 1 }
end
