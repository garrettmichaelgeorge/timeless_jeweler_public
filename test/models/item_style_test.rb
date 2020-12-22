# == Schema Information
#
# Table name: item_styles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_item_styles_on_name  (name) UNIQUE
#
require 'test_helper'

class ItemStyleTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:items)
  end

  context 'validations' do
    subject { described_class.new(name: 'Art Deco') }

    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
    should validate_uniqueness_of(:name)
  end
end
