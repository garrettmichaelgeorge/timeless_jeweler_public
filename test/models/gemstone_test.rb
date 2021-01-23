# == Schema Information
#
# Table name: gemstone_profiles
#
#  id                   :bigint           not null, primary key
#  carat                :decimal(, )
#  role                 :string(20)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstone_profiles_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#

require 'test_helper'

class GemstoneTest < ActiveSupport::TestCase
  ROLES = %w[Mounted Listed].freeze

  context 'associations' do
    should belong_to(:category)

    should_eventually have_many(:reports)
    should_eventually have_many(:tags)

    should have_one(:cut_grading)
    should have_one(:cut).through(:cut_grading)

    should have_one(:color_grading)
    should have_one(:color).through(:color_grading)

    should have_one(:clarity_grading)
    should have_one(:clarity).through(:clarity_grading)
  end

  context 'validations' do
    should validate_length_of(:role).is_at_most(20)
    should validate_inclusion_of(:role).in_array(ROLES)
  end

  context 'delegations' do
    should delegate_method(:grade).to(:cut).with_prefix(true)
    should delegate_method(:grade).to(:color).with_prefix(true)
    should delegate_method(:grade).to(:clarity).with_prefix(true)
  end
end

class Gemstone
  class ListedTest < ActiveSupport::TestCase
    context 'associations' do
      should have_one(:listing)
    end
  end

  class MountedTest < ActiveSupport::TestCase
    context 'associations' do
      should have_one(:mounting)
      should have_one(:piece).through(:mounting)
    end
  end
end
