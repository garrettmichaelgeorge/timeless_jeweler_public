# == Schema Information
#
# Table name: diamond_cuts
#
#  id         :bigint           not null, primary key
#  grade      :string(9)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class Product
  class Gemstone
    class DiamondCutTest < ActiveSupport::TestCase
      context 'associations' do
        should have_many(:gemstones)
      end
    end
  end
end
