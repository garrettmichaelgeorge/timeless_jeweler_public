### GIVEN ###

Given(/^I have started intake$/) do
  # click_on 'Inventory'
  # click_on 'New Item'
  @item_style     = FactoryBot.build(:item_style, :art_deco)
  @metal_category = FactoryBot.build(:metal_category, name: 'Gold')
  @metal_color    = FactoryBot.build(:metal_color, name: 'White')
  @metal_purity   = FactoryBot.build(:metal_purity, value: '0.99')
  visit new_item_path
end

### WHEN ###

When(/^I specify that the item is a (.+)$/) do |item_category|
  item_category = item_category.gsub(' ', '_').camelize
  choose item_category
end

When('I input information for a piece') do
  @item_attrs = FactoryBot.attributes_for(:item, :piece)
  step('I input information for an item')
end

When(/^I input information for a loose gemstone$/) do
  @item_attrs = FactoryBot.attributes_for(:item, :gemstone)
  step('I input information for an item')
end

When('I input information for an item') do
  page.driver.debug
  fill_in 'Name',           with: @item_attrs[:name], wait: 10
  fill_in 'Notes',          with: @item_attrs[:notes]
  fill_in 'Description',    with: @item_attrs[:description]
  select  @item_style.name, from: 'Style'
  save_screenshot "item_fields_#{DateTime.now.to_s.underscore}.png"
end

When('I add {int} metals( to the item/piece)') do |count|
  count.times do |_i|
    click_on 'Add metal'
    select @metal_color.name,    from: 'Color'
    select @metal_purity.value,  from: 'Purity'
    select @metal_category.name, from: 'Category'
  end
end

When('I add {int} gemstones( to the item/piece)') do |count|
  count.times do |_i|
    click_on 'Add gemstone'
    fill_in 'Carat', with: '3.55'
  end
end

When('I (try to) view the inventory (page)') do
  visit items_path
end

When(/^I complete intake$/) do
  click_on 'Create Item'
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
