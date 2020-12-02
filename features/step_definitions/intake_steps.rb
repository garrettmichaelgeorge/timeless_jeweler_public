### GIVEN ###

Given(/^I have started the intake process$/) do
  # click_on 'Inventory'
  # click_on 'New Item'
  visit new_item_path
end

Given(/^the following item categories exist:$/) do |categories_table|
  categories_table.raw.flatten.each do |category|
    FactoryBot.create(:item_category, name: category.upcase)
  end
end

### WHEN ###

When(/^I complete the intake process$/) do
  click_on('', name: 'commit')
end

When(/^I specify that the item is a (\w*) item$/) do |item_category|
  page.save_page
  select(item_category.capitalize, from: 'Category')
end

### THEN ###

Then(/^I should see the loose diamond in my inventory$/) do
  page.has_content?(@gemstone.name)
end
