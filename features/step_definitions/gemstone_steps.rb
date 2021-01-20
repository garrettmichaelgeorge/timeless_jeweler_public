### THEN ###

Given(/^I have a gemstone$/) do
  pending
end

### WHEN ###

When(/^I go to edit the gemstone above$/) do
  visit gemstone_edit_path(@gemstone)
end

When(/^I change the gemstone's status from loose to mounted$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I change the gemstone's status from mounted to loose$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

### THEN ###

Then(/^I should see that the gemstone is loose$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see a way to mount the gemstone on a piece$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that the gemstone is mounted$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
