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

class GemstoneProfileTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:loose_gemstone)
    should have_one(:mounted_gemstone)
  end

  context 'validations' do
    should validate_length_of(:role).is_at_most(20)
  end
end
