# == Schema Information
#
# Table name: diamond_clarities
#
#  id         :bigint           not null, primary key
#  grade      :string(4)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Diamond::ClarityTest < ActiveSupport::TestCase
  subject { described_class.new(grade: 'D') }

  context 'associations' do
    should have_many(:gradings).inverse_of(:clarity)
    should have_many(:diamonds).through(:gradings).inverse_of(:clarity)
  end

  context 'validations' do
    should validate_presence_of(:grade)
    should validate_uniqueness_of(:grade)
    should validate_length_of(:grade).is_at_most(4)
    should validate_inclusion_of(:grade).in_array(described_class.lookup_values)
  end
end

class Diamond::Clarity::GradingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:clarity)
    should belong_to(:diamond)
  end
end
