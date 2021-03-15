# == Schema Information
#
# Table name: diamond_cuts
#
#  id         :bigint           not null, primary key
#  grade      :string(9)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Diamond::Cut < ApplicationRecord
  # Lookup class
  self.table_name = 'diamond_cuts'

  include Lookupable

  lookup_attribute :grade, maximum_length: 9

  has_many :gradings, inverse_of: :cut, class_name: 'Grading'
  has_many :diamonds, through: :gradings, inverse_of: :cut

  alias_attribute :name, :grade

  class Grading < ApplicationRecord
    self.table_name = 'diamond_cut_gradings'

    belongs_to :cut, inverse_of: :gradings, foreign_key: :diamond_cut_id
    belongs_to :diamond, -> { diamonds },
               inverse_of: :cut_grading, class_name: 'Gemstone',
               foreign_key: :gemstone_profile_id
  end
end
