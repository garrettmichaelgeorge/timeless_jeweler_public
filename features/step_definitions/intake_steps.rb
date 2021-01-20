### GIVEN ###

Given(/^I have started intake$/) do
  # click_on 'Inventory'
  # click_on 'New Item'
  visit new_item_path
end

### WHEN ###

When(/^I specify that the item is a (.+)$/) do |item_category|
  save_screenshot("category_selector_#{DateTime.now.to_s.underscore}.png")
  item_category = item_category.gsub(' ', '_').camelize

  choose item_category
end

When('I input information for a piece') do
  @item_attrs = FactoryBot.attributes_for(:item, :piece)

  step('I specify that the item is a piece')
  step('I input information for an item')

  save_screenshot "piece_fields_#{DateTime.now.to_s.underscore}.png"
end

When(/^I input information for a loose gemstone$/) do
  @item_attrs = FactoryBot.attributes_for(:item, :gemstone)

  step('I specify that the item is a loose gemstone')
  step('I input information for an item')
end

When('I input information for an item') do
  fill_in '', with: @item_attrs[:name],        id: '#item_name'
  fill_in '', with: @item_attrs[:notes],       id: '#item_notes'
  fill_in '', with: @item_attrs[:description], id: '#item_description'
  save_screenshot "piece_fields_#{DateTime.now.to_s.underscore}.png"
end

When(/^I specify that the item has (\d+) gemstones$/) do |count|
  count.times do |i|
    click_on 'Add gemstone'
    fill_in 'Gemstone name', with: "Small gemstone #{i}"
  end
end

When('I (try to) view the inventory (page)') do
  visit items_path
end

When(/^I complete intake$/) do
  click_on '', name: 'commit'
end

### THEN ###

Then(/^I should see that the piece has (\d+) gemstones$/) do |count|
  _(@item.gemstones.count).must_equal(count)
end

Then(/^I should see the item in my inventory$/) do
  page.has_content? @item.name
end

Then(/^I should see the item page$/) do
  page.has_table?('items')
end

Then(/^I should not be able to see the inventory$/) do
  page.has_no_table?('items')
end

Then(/^I should be able to add a gemstone to the piece$/) do
  page.has_content? 'Add gemstone'
end

Then('I should not see a way to( add)( or)( remove) gemstones to the piece') do
  _(page).wont_have_content('Add gemstone')
  _(page).wont_have_content('Remove gemstone')
end
