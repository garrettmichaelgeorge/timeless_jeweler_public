require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
    @person.save
    assert @person.acting_as.id
  end

  test "should be equal to the subtype of its supertype (i.e. parties)" do
    @person.save
    assert_equal @person, @person.acting_as.specific
  end
end
