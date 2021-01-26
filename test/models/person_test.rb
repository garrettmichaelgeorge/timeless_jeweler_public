# == Schema Information
#
# Table name: people
#
#  id                    :bigint           not null, primary key
#  birthday              :date
#  first_name            :string(40)
#  last_name             :string(40)
#  necklace_length       :decimal(4, 2)
#  necklace_length_notes :text
#  ring_size             :decimal(4, 2)
#  ring_size_notes       :text
#  suffix                :string(20)
#  title                 :string(20)
#  household_id          :bigint
#
# Indexes
#
#  index_people_on_household_id  (household_id)
#
# Foreign Keys
#
#  fk_rails_...  (household_id => households.id)
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  subject { FactoryBot.build(:person) }

  context 'associations' do
    should have_many(:sales)
    should have_many(:addresses)
    should have_many(:phone_numbers)
    should have_many(:email_addresses)
  end

  context 'validations' do
    should validate_presence_of(:first_name)
    should validate_length_of(:first_name).is_at_most(40)
    should validate_length_of(:last_name).is_at_most(40)
  end

  it 'acts as a party' do
    _(subject.acting_as).must_be_instance_of Party
  end

  it 'should be equal to the subtype of its supertype (i.e. parties)' do
    _(subject.acting_as.specific).must_equal subject
  end

  describe '#create_household_from_last_name!' do
    it 'creates new household from last name' do
      subject.create_household_from_last_name!

      _(subject.household).wont_be_nil
    end

    it "doesn't create new household from last name if one already exists" do
      subject.create_household_from_last_name!

      _(subject.create_household_from_last_name!)
        .must_equal subject.household,
                    "Should return the person's household if one exists"
    end
  end
end
