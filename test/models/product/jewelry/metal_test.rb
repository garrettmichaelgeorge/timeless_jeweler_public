# == Schema Information
#
# Table name: metals
#
#  id               :bigint           not null, primary key
#  name             :string(40)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  jewelry_piece_id :bigint           not null
#
# Indexes
#
#  index_metals_on_jewelry_piece_id  (jewelry_piece_id)
#  index_metals_on_name              (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (jewelry_piece_id => jewelry_pieces.id)
#
require 'test_helper'

class Product::Jewelry::MetalTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:jewelry_product)
    should belong_to(:category)
    should belong_to(:color)
    should belong_to(:purity)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should validate_length_of(:name).is_at_most(20)
  end
end
