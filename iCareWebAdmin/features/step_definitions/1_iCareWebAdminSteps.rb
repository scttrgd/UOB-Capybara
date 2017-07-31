Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
# Capybara.default_driver = :selenium

Given(/^the user is not logged in$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
  expect(page).to have_no_content "iCare"
end


################################################################################
##################### FEATURE: AUTOLOAD PROGRAM ACCESS #########################
################################################################################
Given(/^the user attempts to visit the AutoLoad Program$/) do
  visit ENV['SERVER']+"/dd_batch_update"
end



When(/^the User logs in as Finance Admin$/) do
  fill_in 'Username', with: $it52[0]
  fill_in 'Password', with: $it52[1]
  click_on('Log in')
end

Then(/^the user should be redirected back to the Batch Update Module$/) do
  expect(page).to have_content "Direct Debit Batch Update"
  click_on('Logout')
end

When(/^the User logs in as Student Admin$/) do
  fill_in 'username', with: $it51[0]
  fill_in 'password', with: $it51[1]
  click_on('Log in')
end

Then(/^the user should be denied access$/) do
  expect(page).to have_content "denied"
end

################################################################################
##################### FEATURE: SEARCH FOR USER ACCOUNTS ########################
################################################################################

Given(/^the user is logged in$/) do
  visit ENV['SERVER']+"/account_admin"
    if page.has_title?('iCare Administration Module| University of Bath')
    else
      fill_in 'username', with: $it52[0]
      fill_in 'password', with: $it52[1]
      click_on('Log in')
    end
end

Given(/^the user attempts to visit the account search$/) do
  visit ENV['SERVER']+"/search_customer"
  expect(page).to have_content "Please enter customer's details below to first locate the correct customer"
end

When(/^the user submits the search form$/) do
  click_on('Search')
end

When(/^the form is empty$/) do
end

Then(/^the user should receive an error$/) do
  expect(page).to have_css ".error"
end

When(/^the user inputs "([^"]*)" into forename$/) do |arg1|
  fill_in 'forename', with: arg1
end
When(/^the user inputs "([^"]*)" into surname$/) do |arg1|
  fill_in 'surname', with: arg1
end

When(/^the user inputs "([^"]*)" into library card$/) do |arg1|
  fill_in 'libraryCard', with: arg1
end

When(/^the user inputs "([^"]*)" into email$/) do |arg1|
  fill_in 'email', with: arg1
end

When(/^the user inputs "([^"]*)" into project code$/) do |arg1|
  fill_in 'projectCode', with: arg1
end

When(/^the user inputs "([^"]*)" into icare customer number$/) do |arg1|
  fill_in 'iCareCustomerNo', with: arg1
end

When(/^the user submits the search$/) do
  click_on('Search')
end

Then(/^"([^"]*)" should be included in the search results$/) do |arg1|
  expect(page).to have_content(/#{arg1}|No Customers Found/)
end

When(/^the user inputs less than ten characters \- "([^"]*)" into Library Card$/) do |arg1|
  fill_in 'libraryCard', with: arg1 # Write code here that turns the phrase above into concrete actions
end

Then(/^a validation error should occur$/) do
  assert_text('Library card must be 10 characters only') # Write code here that turns the phrase above into concrete actions
end
