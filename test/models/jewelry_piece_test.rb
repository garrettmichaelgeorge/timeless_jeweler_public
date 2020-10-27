# == Schema Information
#
# Table name: jewelry_pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class JewelryPieceTest < ActiveSupport::TestCase
  should have_many(:gemstones), through: :mountings
end
