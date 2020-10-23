# == Schema Information
#
# Table name: diamond_grades
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  diamond_clarity_id :bigint           not null
#  diamond_color_id   :bigint           not null
#  diamond_cut_id     :bigint           not null
#
# Indexes
#
#  index_diamond_grades_on_diamond_clarity_id  (diamond_clarity_id)
#  index_diamond_grades_on_diamond_color_id    (diamond_color_id)
#  index_diamond_grades_on_diamond_cut_id      (diamond_cut_id)
#
# Foreign Keys
#
#  fk_rails_...  (diamond_clarity_id => diamond_clarities.id)
#  fk_rails_...  (diamond_color_id => diamond_colors.id)
#  fk_rails_...  (diamond_cut_id => diamond_cuts.id)
#
class DiamondGrade < ApplicationRecord
  belongs_to :diamond_cut
  belongs_to :diamond_color
  belongs_to :diamond_clarity
end