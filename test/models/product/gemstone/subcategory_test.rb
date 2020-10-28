# == Schema Information
#
# Table name: gemstone_subcategories
#
#  id                   :bigint           not null, primary key
#  name                 :string(40)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  gemstone_category_id :bigint           not null
#
# Indexes
#
#  index_gemstone_subcategories_on_gemstone_category_id  (gemstone_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_category_id => gemstone_categories.id)
#
require 'test_helper'

class Product
  class Gemstone
    class SubcategoryTest < ActiveSupport::TestCase
      context 'associations' do
        should belong_to(:category)
      end

      context 'validations' do
        should validate_presence_of(:name)
        should validate_length_of(:name)
      end
    end
  end
end
