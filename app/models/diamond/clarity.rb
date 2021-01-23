# == Schema Information
#
# Table name: diamond_clarities
#
#  id         :bigint           not null, primary key
#  grade      :string(4)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Diamond::Clarity < ApplicationRecord
  # Lookup class
  self.table_name = 'diamond_clarities'

  validates :grade, presence: true,
                    uniqueness: true,
                    length: { maximum: 4 }

  has_many :gradings, inverse_of: :clarity, class_name: 'Grading'
  has_many :diamonds, through: :gradings

  class Grading < ApplicationRecord
    self.table_name = 'diamond_clarity_gradings'

    belongs_to :clarity, inverse_of: :gradings, foreign_key: :diamond_clarity_id
    belongs_to :diamond, -> { diamonds },
               inverse_of: :clarity_grading, class_name: 'Gemstone',
               foreign_key: :gemstone_profile_id
  end
end
