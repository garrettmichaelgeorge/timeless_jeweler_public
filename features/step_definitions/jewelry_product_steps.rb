When(/^I specify that the product is a jewelry product$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^when I specify that the jewelry product is a ring$/) do
  pending # Write code here that turns the phrase above into concrete actions
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
