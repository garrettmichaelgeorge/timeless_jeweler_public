When(/^I try to view the inventory$/) do
  visit items_path
end

Then(/^I should see the inventory$/) do
  page.has_table?('items')
end

Then(/^I should not be able to see the inventory$/) do
  page.has_no_table?('items')
end
