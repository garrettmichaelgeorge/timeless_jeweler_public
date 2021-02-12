# == Schema Information
#
# Table name: piece_subcategories
#
#  id         :bigint           not null, primary key
#  code       :string(1)
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_piece_subcategories_on_code  (code) UNIQUE
#  index_piece_subcategories_on_name  (name) UNIQUE
#
require 'test_helper'

class Piece
  class SubcategoryTest < ActiveSupport::TestCase
    subject { Subcategory.new(name: 'Ring', code: 'R') }

    context 'associations' do
      should have_many(:pieces).inverse_of(:subcategory)
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
