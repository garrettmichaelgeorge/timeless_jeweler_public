Given(/^I have a handbag$/) do
end

When(/^I specify that the product is a handbag$/) do
  select('Handbag', from: 'Product Subcategory')
end

Then(/^I should see that the product is a handbag$/) do
  page.has_content?('handbag')
end
