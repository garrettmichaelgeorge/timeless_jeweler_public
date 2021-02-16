# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_purities_on_value  (value) UNIQUE
#
require 'test_helper'

class Metal
  class PurityTest < ActiveSupport::TestCase
    ALLOWED_VALUES = I18n.t('metal_purities', scope: :lookup).freeze

    context 'associations' do
      should have_many(:metals)
    end

    context 'validations' do
      should validate_presence_of(:value)
      should validate_uniqueness_of(:value)
      should validate_length_of(:value).is_at_most(10)
      should validate_inclusion_of(:value)
        .in_array(ALLOWED_VALUES)
    end
  end
end
