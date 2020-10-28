# == Schema Information
#
# Table name: diamond_cuts
#
#  id         :bigint           not null, primary key
#  grade      :string(9)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product
  class Gemstone
    class DiamondCut < ApplicationRecord
      validates :grade, presence: true
      validates :grade, uniqueness: true
      validates :grade, length: { maximum: 9 }
    end
  end
end
