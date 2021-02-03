# == Schema Information
#
# Table name: diamond_colors
#
#  id         :bigint           not null, primary key
#  grade      :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Diamond::Color < ApplicationRecord
  # Lookup class
  self.table_name = 'diamond_colors'

  validates :grade, presence: true,
                    uniqueness: true,
                    length: { maximum: 1 }

  has_many :gradings, inverse_of: :color, class_name: 'Grading'
  has_many :diamonds, through: :gradings

  class Grading < ApplicationRecord
    self.table_name = 'diamond_color_gradings'

    belongs_to :color, inverse_of: :gradings, foreign_key: :diamond_color_id
    belongs_to :diamond, -> { diamonds },
               inverse_of: :color_grading,
               class_name: 'Gemstone',
               foreign_key: :gemstone_profile_id
  end
end
