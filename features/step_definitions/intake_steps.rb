Given(/^I have started the intake process$/) do
  # click_on 'Inventory'
  # click_on 'New Product'
  visit new_product_path
end

When(/^I complete the intake process$/) do
  click_on 'Submit'
end

Then(/^I should see that the jewelry product has (\d+) gemstones$/) do |count|
  expect(jewelry_product.gemstones.count).to eq(count)
end

When(/^I input information for a ring$/) do
  fill_in('Name', with: 'Small art deco ring with two diamonds')
  fill_in('Description', with: 'Lorem ipsum sic dolor amet')
  fill_in('Notes', with: 'My private notes about the ring')
  select('Jewelry', from: 'Product category')
end

When(/^I specify that the product has (\d+) gemstones$/) do |_count|
  count.times do |i|
    click_on('Add gemstone')
    fill_in('Gemstone name', with: "Small gemstone #{i}")
  end
end

Then(/^I should see the ring in my inventory$/) do
  page.has_content? 'Ring'
end

Then(/^I should see that the ring has (\d+) diamonds$/) do |_arg1|
  page.has_content? '2'
end

Then(/^I should see the necklace in my inventory$/) do
  page.has_content? @necklace.name
end

Then(/^I should see that the necklace has no gemstones$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I input information for a loose diamond$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the loose diamond in my inventory$/) do
  page.has_content?(@gemstone_product.name)
end

When(/^I input information for a handbag$/) do
  @handbag = { name: "Trendy ladies' handbag",
               description: 'Lorem ipsum sic dolor amet',
               notes: 'My private notes about the handbag' }

  fill_in('Name', with: @handbag.name)
  fill_in('Description', with: @handbag.description)
  fill_in('Notes', with: @handbag.notes)
  select('Miscellaneous', from: 'Product category')
end

Then(/^I should see the handbag in my inventory$/) do
  page.has_content?('handbag')
end
