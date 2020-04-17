require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Inventory"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Clarity", with: @product.clarity
    fill_in "Color", with: @product.color
    fill_in "Cost", with: @product.cost
    fill_in "Customer", with: @product.customer_id
    fill_in "Date sold", with: @product.date_sold
    fill_in "Length", with: @product.length
    fill_in "Metal", with: @product.metal
    fill_in "Miscellaneous measurements", with: @product.miscellaneous_measurements
    fill_in "Narrative description", with: @product.narrative_description
    fill_in "Notes", with: @product.notes
    fill_in "Purity", with: @product.purity
    fill_in "Report number", with: @product.report_number
    fill_in "Retail price", with: @product.retail_price
    fill_in "Size", with: @product.size
    fill_in "Source", with: @product.source
    fill_in "Weight", with: @product.weight
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Clarity", with: @product.clarity
    fill_in "Color", with: @product.color
    fill_in "Cost", with: @product.cost
    fill_in "Customer", with: @product.customer_id
    fill_in "Date sold", with: @product.date_sold
    fill_in "Length", with: @product.length
    fill_in "Metal", with: @product.metal
    fill_in "Miscellaneous measurements", with: @product.miscellaneous_measurements
    fill_in "Narrative description", with: @product.narrative_description
    fill_in "Notes", with: @product.notes
    fill_in "Purity", with: @product.purity
    fill_in "Report number", with: @product.report_number
    fill_in "Retail price", with: @product.retail_price
    fill_in "Size", with: @product.size
    fill_in "Source", with: @product.source
    fill_in "Weight", with: @product.weight
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
