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
  validates :grade, presence: true
  validates :grade, uniqueness: true
  validates :grade, length: { maximum: 1 }
end
