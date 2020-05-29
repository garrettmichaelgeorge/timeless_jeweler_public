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
  def setup
    @person = Person.new(title: "Mrs.",
                         first_name: "Clara",
                         last_name: "Schumann",
                         suffix: nil,
                         ring_size: 33.5,
                         ring_size_notes: "Will need to resize next visit",
                         necklace_length: 40,
                         necklace_length_notes: "Prefers very lightweight necklaces. Too short better than too long.")
  end

  test "should be valid" do
    assert @person.valid?
  end

  test "first name should be present" do
    @person.first_name = ""
    assert_not @person.valid?
  end

  test "first name should not be too long" do
    @person.first_name = "a" * 41
    assert_not @person.valid?
  end

  test "last name should not be too long" do
    @person.last_name = "a" * 41
    assert_not @person.valid?
  end

  test "new person should have a corresponding party id" do
    assert_equal Party, @person.acting_as.class
  end

  test "should have a corresponding party id on save" do
    @person.save!
    assert @person.acting_as.id
  end

  test "should be equal to the subtype of its supertype (i.e. parties)" do
    @person.save!
    assert_equal @person, @person.acting_as.specific
  end

  test "should create new household from last name" do
    @person.create_household_from_last_name!
    assert @person.household
  end

  test "should not create new household from last name if one already exists" do
    @person.create_household_from_last_name!
    assert_not @person.create_household_from_last_name!, "Person already has a household!"
  end

end
