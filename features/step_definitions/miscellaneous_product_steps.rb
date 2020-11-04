When(/^I input information for a handbag$/) do
  @handbag = { name: "Trendy ladies' handbag",
               description: 'Lorem ipsum sic dolor amet',
               notes: 'My private notes about the handbag' }

  fill_in('Name', with: @handbag[:name])
  fill_in('Description', with: @handbag[:description])
  fill_in('Notes', with: @handbag[:notes])
  step 'I specify that the product is a miscellaneous product'
end

Then(/^I should see that the product is a handbag$/) do
  page.has_content?('handbag')
end
