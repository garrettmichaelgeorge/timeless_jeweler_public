# == Schema Information
#
# Table name: gemstone_profiles
#
#  id         :bigint           not null, primary key
#  carat      :decimal(, )
#  role       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GemstoneTest < ActiveSupport::TestCase
  ROLES = %w[Mounted Loose].freeze

  context 'validations' do
    should validate_length_of(:role).is_at_most(20)
    should validate_inclusion_of(:role).in_array(ROLES)
  end

  describe '.inheritance_column' do
    it 'returns "role"' do
      _(described_class.inheritance_column).must_equal 'role'
    end
  end
end

class Gemstone
  class ListingTest < ActiveSupport::TestCase
    context 'associations' do
      should have_one(:loose_gemstone)
    end
  end

  class MountingTest < ActiveSupport::TestCase
    context 'associations' do
      should have_one(:mounted_gemstone)
    end
  end
end
