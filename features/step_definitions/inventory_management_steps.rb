Given(/^I have started the intake process$/) do
  visit new_product_path
end

When(/^I select the Gemstone category$/) do
  select('Gemstone', from: 'Category')
end

When(/^I submit the form$/) do
  click_button 'Submit'
end

Then(/^I should see that the new item is labeled 'gemstone'$/) do
  expect(page).to have_content('gemstone')
end

Then(/^I should not see a field to attach the gemstone above to a piece$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I go to edit the piece above$/) do
  visit piece_edit_path
end

Then(/^I should not see a way to add gemstones$/) do
  expect(page).to have_no_content('add gemstone')
end

Then(/^I should not see a way to remove gemstones$/) do
  expect(page).to have_no_content('remove gemstone')
end

Given(/^I have selected the 'Piece' category$/) do
  select('Piece', from: 'Category')
end

When(/^I add (\d+) gemstones to the piece above$/) do |_added|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I press 'submit'$/) do
  click_link_or_button 'submit'
end

Then(/^I should see that the piece has (\d+) gemstones$/) do |count|
  expect(piece.gemstones.count).to eq(count)
end

When(/^I try to view the inventory$/) do
  visit products_path
end

Then(/^I should see the inventory$/) do
  page.has_table?('products')
end

Then(/^I should not be able to see the inventory$/) do
  page.has_no_table?('products')
end

Given(/^I have filled all required fields except for Category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I go to edit the gemstone above$/) do
  visit gemstone_edit_path
end

Then(/^I should not see a way to mount the gemstone on a piece$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
