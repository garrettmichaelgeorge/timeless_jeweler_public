# == Schema Information
#
# Table name: metal_colors
#
#  id         :bigint           not null, primary key
#  name       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_colors_on_name  (name) UNIQUE
#
require 'test_helper'

class Metal
  class ColorTest < ActiveSupport::TestCase
    ALLOWED_VALUES = %w[White Yellow Rose].freeze

    context 'associations' do
      should have_many(:metals).inverse_of(:color)
    end

    context 'validations' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
      should validate_length_of(:name).is_at_most(10)
      should validate_inclusion_of(:name)
        .in_array(ALLOWED_VALUES)
    end
  end
end
