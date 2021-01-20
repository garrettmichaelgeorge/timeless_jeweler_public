### WHEN ###

When('I follow {string}') do |link|
  click_on link
end

When('I click/press {string}') do |button|
  click_on button
end

### THEN ###

Then('I should see {string}') do |text|
  page.has_content? text
end
