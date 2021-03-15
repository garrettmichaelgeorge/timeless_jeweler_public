# == Schema Information
#
# Table name: metal_categories
#
#  id         :bigint           not null, primary key
#  name       :string(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_categories_on_name  (name) UNIQUE
#

require 'test_helper'

class Metal
  class CategoryTest < ActiveSupport::TestCase
    def self.lookup_values
      I18n.t('metal_categories', scope: :lookup)
    end

    context 'associations' do
      should have_many(:metals).inverse_of(:category)
    end

    context 'validations' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
      should validate_length_of(:name).is_at_most(20)
      should validate_inclusion_of(:name)
        .in_array(lookup_values)
    end
  end
end
