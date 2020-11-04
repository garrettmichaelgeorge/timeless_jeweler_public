### GIVEN ###

Given(/^I have started the intake process$/) do
  # click_on 'Inventory'
  # click_on 'New Product'
  visit new_product_path
end

Given(/^the following product categories exist:$/) do |categories_table|
  categories_table.raw.flatten.each do |category|
    FactoryBot.create(:product_category, name: category.upcase)
  end
end

### WHEN ###

When(/^I complete the intake process$/) do
  click_on('', name: 'commit')
end

When(/^I specify that the product is a (\w*) product$/) do |product_category|
  page.save_page
  select(product_category.capitalize, from: 'Category')
end

### THEN ###

Then(/^I should see the loose diamond in my inventory$/) do
  page.has_content?(@gemstone_product.name)
end
