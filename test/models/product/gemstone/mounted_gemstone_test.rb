# == Schema Information
#
# Table name: mountings
#
#  gemstone_id      :bigint           not null
#  jewelry_piece_id :bigint           not null
#
# Indexes
#
#  index_mountings_on_gemstone_id       (gemstone_id)
#  index_mountings_on_jewelry_piece_id  (jewelry_piece_id)
#
require 'test_helper'

class Product
  class Gemstone
    class MountedGemstoneTest < ActiveSupport::TestCase
      context 'associations' do
        should belong_to(:gemstone)
        should belong_to(:jewelry_product)
      end
    end
  end
end
