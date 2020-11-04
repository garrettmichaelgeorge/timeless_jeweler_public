### GIVEN ###

### WHEN ###
When(/^I input information for a necklace$/) do
  @necklace = { name: 'Classic diamond necklace',
                description: 'Lorem ipsum sic dolor amet',
                notes: 'My private notes about the necklace' }

  fill_in('Name', with: @necklace[:name])
  fill_in('Description', with: @necklace[:description])
  fill_in('Notes', with: @necklace[:notes])
  step 'I specify that the product is a jewelry product'
  page.save_page
end

When(/^I input information for a ring$/) do
  @ring = {
    name: 'Small art deco ring with two diamonds',
    description: 'Lorem ipsum sic dolor amet',
    notes: 'My private notes about the ring'
  }

  fill_in('Name', with: @ring[:name])
  fill_in('Description', with: @ring[:description])
  fill_in('Notes', with: @ring[:notes])
  step 'I specify that the product is a jewelry product'
end

When(/^I specify that the product has (\d+) gemstones$/) do |_count|
  count.times do |i|
    click_on('Add gemstone')
    fill_in('Gemstone name', with: "Small gemstone #{i}")
  end
end

### THEN ###

Then(/^I should see the ring in my inventory$/) do
  page.has_content? 'Ring'
end

Then(/^I should see that the ring has (\d+) diamonds$/) do |count|
  page.has_content? count
end

Then(/^I should see that the ring has (\d+) gemstones$/) do |count|
  page.has_content? count
end

Then(/^I should see the necklace in my inventory$/) do
  page.has_content? @necklace.name
end

Then(/^I should be able to add a gemstone to the jewelry product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see a way to add gemstones to the jewelry product$/) do
  expect(page).to have_no_content('add gemstone')
end

Then(/^I should not see a way to remove gemstones from the jewelry product$/) do
  expect(page).to have_no_content('remove gemstone')
end

Then(/^I should see that the jewelry product has (\d+) gemstones$/) do |count|
  expect(jewelry_product.gemstones.count).to eq(count)
end

Then(/^I should see the handbag in my inventory$/) do
  page.has_content?(@handbag.name)
end
