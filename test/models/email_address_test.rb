# == Schema Information
#
# Table name: email_addresses
#
#  id             :bigint           not null, primary key
#  email_address  :string
#  emailable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  emailable_id   :bigint           not null
#
# Indexes
#
#  index_email_addresses_on_emailable_type_and_emailable_id  (emailable_type,emailable_id)
#
require 'test_helper'

class EmailAddressTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:emailable)
  end

  context 'validations' do
    subject { FactoryBot.build(:email_address) }

    should validate_presence_of(:email_address)
    should validate_length_of(:email_address).is_at_most(255)
    should validate_uniqueness_of(:email_address).ignoring_case_sensitivity
    should allow_values('vALID@e.o, g48381274if@e2.a')
      .for(:email_address)
    should_not allow_values('invalidEmail', 'invalid@email')
      .for(:email_address)
  end
end
