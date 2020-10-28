# == Schema Information
#
# Table name: diamond_clarities
#
#  id         :bigint           not null, primary key
#  grade      :string(4)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product
  class Gemstone
    class DiamondClarity < ApplicationRecord
      validates :grade, presence: true
      validates :grade, uniqueness: true
      validates :grade, length: { maximum: 4 }
    end
  end
end
