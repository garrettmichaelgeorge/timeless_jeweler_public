# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_merchants_on_name  (name) UNIQUE
#

require 'test_helper'

describe Merchant do
  subject { described_class.new }

  context 'associations' do
    should have_many(:items)
    should have_many(:clerks)
    should have_many(:admins)
  end

  context 'validations' do
    subject { described_class.new(name: 'name') }

    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
