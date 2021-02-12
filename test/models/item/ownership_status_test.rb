# == Schema Information
#
# Table name: item_ownership_statuses
#
#  id         :bigint           not null, primary key
#  code       :string(1)        not null
#  name       :string(40)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Item
  class OwnershipStatusTest < ActiveSupport::TestCase
    subject { described_class.new(name: 'Consigned', code: 'C') }

    context 'associations' do
      should have_many(:items).inverse_of(:ownership_status)
    end

    context 'validations' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
      should validate_length_of(:name).is_at_most(40)
      should validate_presence_of(:code)
      should validate_uniqueness_of(:code)
      should validate_length_of(:code).is_at_most(1)
    end
  end
end
