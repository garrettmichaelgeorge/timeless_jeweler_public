# == Schema Information
#
# Table name: diamond_colors
#
#  id         :bigint           not null, primary key
#  grade      :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class DiamondColorTest < ActiveSupport::TestCase
  context 'validations' do
    subject { described_class.new(grade: 'D') }

    should validate_presence_of(:grade)
    should validate_uniqueness_of(:grade)
    should validate_length_of(:grade).is_at_most(1)
  end
end
