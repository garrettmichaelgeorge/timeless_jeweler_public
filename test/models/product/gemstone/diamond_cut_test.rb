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

class DiamondCutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
