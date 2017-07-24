# Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
Capybara.default_driver = :selenium


Given(/^the user attempts to visit the AutoLoad Program$/) do
  visit "https://www.bath.ac.uk/accommodation/icareadmin/dd_batch_update"
end

Given(/^the user is not logged in$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
  expect(page).to have_no_content "iCare"
end

When(/^the User logs in as Finance Admin$/) do
  fill_in 'Username', with: $it52[0]
  fill_in 'Password', with: $it52[1]
  click_on('Log in')
end

Then(/^the user should be redirected back to the Batch Update Module$/) do
  expect(page).to have_content "Direct Debit Batch Update"
end

When(/^the User logs in as Student Admin$/) do
  fill_in 'username', with: $it51[0]
  fill_in 'password', with: $it51[1]
  click_on('Log in')
end

Then(/^the user should be denied access$/) do
  expect(page).to have_title "Apache Tomcat/7.0.47 - Error report"
end
