# == Schema Information
#
# Table name: email_addresses
#
#  id            :bigint           not null, primary key
#  email_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class EmailAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
