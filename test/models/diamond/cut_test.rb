# == Schema Information
#
# Table name: diamond_cuts
#
#  id         :bigint           not null, primary key
#  grade      :string(9)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Diamond::CutTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:gradings)
    should have_many(:diamonds).through(:gradings)
  end

  context 'validations' do
    subject { described_class.new(grade: 'VVS1') }

    should validate_presence_of(:grade)
    should validate_uniqueness_of(:grade)
    should validate_length_of(:grade).is_at_most(9)
    should_eventually validate_inclusion_of(:grade)
  end
end

class Diamond::Cut::GradingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:cut)
    should belong_to(:diamond)
  end
end
