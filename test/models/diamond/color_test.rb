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

class Diamond::ColorTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:gradings).inverse_of(:color)
    should have_many(:diamonds).through(:gradings).inverse_of(:color)
  end

  context 'validations' do
    subject { described_class.new(grade: 'D') }

    should validate_presence_of(:grade)
    should validate_uniqueness_of(:grade)
    should validate_length_of(:grade).is_at_most(1)
    should validate_inclusion_of(:grade).in_array(described_class.lookup_values)
  end
end

class Diamond::Color::GradingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:color).inverse_of(:gradings)
    should belong_to(:diamond).inverse_of(:color_grading)
  end
end
