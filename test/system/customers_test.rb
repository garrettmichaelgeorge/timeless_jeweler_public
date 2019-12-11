require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Birthday", with: @customer.birthday
    fill_in "First name", with: @customer.first_name
    fill_in "Gender", with: @customer.gender
    fill_in "Household", with: @customer.household_id
    fill_in "Necklace length", with: @customer.necklace_length
    fill_in "Necklace length notes", with: @customer.necklace_length_notes
    fill_in "Ring size", with: @customer.ring_size
    fill_in "Ring size notes", with: @customer.ring_size_notes
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @customer.birthday
    fill_in "First name", with: @customer.first_name
    fill_in "Gender", with: @customer.gender
    fill_in "Household", with: @customer.household_id
    fill_in "Necklace length", with: @customer.necklace_length
    fill_in "Necklace length notes", with: @customer.necklace_length_notes
    fill_in "Ring size", with: @customer.ring_size
    fill_in "Ring size notes", with: @customer.ring_size_notes
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
