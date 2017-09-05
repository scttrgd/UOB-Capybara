

## Some Variables that get reused throughout
$i = 0
$invalid_project_code = 'not valid'
$valid_project_code = 'CA-CS1ACH'
$valid_user_id = $it51[0]


Given(/^the user is not logged in$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
  # expect(page).to have_no_content "iCare"
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
  if Capybara.current_driver == Capybara.javascript_driver
    # SELENIUM DOESNT SUPPORT HTTP SATUS CODES, POLTERGEIS DOES #
    expect(page.status_code).to be(403)
  else
    # SELENIUM DOESNT SUPPORT HTTP SATUS CODES, POLTERGEIS DOES #
    expect(page).to have_content "403"
  end
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

When(/^the user inputs "([^"]*)" into forename$/) do |forename|
  fill_in 'forename', with: forename
end
When(/^the user inputs "([^"]*)" into surname$/) do |surname|
  fill_in 'surname', with: surname
end

When(/^the user inputs "([^"]*)" into library card$/) do |libraryCard|
  fill_in 'libraryCard', with: libraryCard
end

When(/^the user inputs "([^"]*)" into email$/) do |email|
  fill_in 'email', with: email
end

When(/^the user inputs "([^"]*)" into project code$/) do |projectCode|
  fill_in 'projectCode', with: projectCode
end

When(/^the user inputs "([^"]*)" into icare customer number$/) do |iCareCustomerNo|
  fill_in 'iCareCustomerNo', with: iCareCustomerNo
end

When(/^the user submits the search$/) do
  click_on('Search')
end

Then(/^"([^"]*)" should be included in the search results$/) do |forename|
  expect(page).to have_content(/#{forename}|No Customers Found/)
end

When(/^the user inputs less than ten characters \- "([^"]*)" into Library Card$/) do |libraryCard|
  fill_in 'libraryCard', with: libraryCard
end

Then(/^a validation error should occur$/) do
  assert_text('Library card must be 10 characters only')
end

Given(/^the user searches using "([^"]*)"$/) do |arg1|
  visit ENV['SERVER']+"/search_customer"
  fill_in 'forename', with: arg1
  click_on('Search')
end

Given(/^they attempt to edit the customer record$/) do
  find('.edit').click
end

When(/^they update the "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
  click_on('Update')
  $i += 1
end

Then(/^they receive a confirmation message$/) do
  expect(page).to have_content('Successfully updated customer details for Card Number')
end

Then(/^they should confirm that "([^"]*)" is updated with "([^"]*)"$/) do |arg1, arg2|
  visit ENV['SERVER']+"/search_customer"
  fill_in 'forename', with: arg1
  click_on('Search')
  expect(page).to have_content(arg2)
end

Then(/^they should be able to return and revert the contents of "([^"]*)" to "([^"]*)" for "([^"]*)"$/) do |arg1, arg2, arg3|
  visit ENV['SERVER']+"/search_customer"
  fill_in 'forename', with: arg3
  click_on('Search')
  find('.edit').click
  fill_in arg1, with: arg2
  click_on('Update')
  $i += 1
end

Given(/^the user clicks view audit$/) do
  click_on('View Audit')
end

Then(/^the user should see at least the number of updates that has taken place today$/) do
  expect(page).to have_content('Successfully update customer', :minimum => $i)
end

Given(/^the user clicks select customer$/) do
  click_on('Select Customer')
end

Then(/^the user should see all available customer accounts$/) do
  expect(page).to have_css('table.account')
end

When(/^the user clicks Deactiate account$/) do
  click_on('Deactivate')
end

Then(/^the status of the Customer account should be inactive$/) do
  expect(page).to have_content('Successfully updated the account status for Customer ID')
  expect(page).to have_css('.reactivateAccount')
  expect(page).to have_content('Inactive (Closed)')
end

Then(/^the user should be able to reactivate the account$/) do
  within('table.account') do
    click_on('Reactivate')
  end
  expect(page).to have_content('Active')
end

Given(/^the user attempts to visit the bulk account creation screen$/) do
  visit ENV['SERVER']+"/bulk_account_create"
end

When(/^the user sees the select box$/) do
  # This is a little janky, but I didn't want to just have the outcome in this test (see below)
  expect(page).to have_select('programCode')
end

Then(/^the only select option should only be Eat and drink open university$/) do
  expect(page).to have_select 'programCode', options: ['Eat and Drink Open University']
end

Given(/^the user attempts to visit the Program Accounts List$/) do
  visit ENV['SERVER']+"/view_accounts"
end

When(/^the user selects "([^"]*)" from the Program Type select box$/) do |programCode|
  select(programCode, :from=> 'programCode')
end

When(/^clicks View Accounts$/) do
  find('#viewAccounts').click # Write code here that turns the phrase above into concrete actions
end

Then(/^the user should see "([^"]*)" in the list$/) do |arg1|
  expect(page).to have_content(arg1, :minimum => 2)
end

Given(/^the user attempts to visit the iCare Transactions by Trace ID page$/) do
  visit ENV['SERVER']+"/reports/icare_transactions"
end

Given(/^the user leaves all fields as default$/) do
  select('Any', :from=> 'programCode')
  select('Any', :from=> 'transType')
  select('Any', :from=> 'transGroup')
  select('Any', :from=> 'academicYear')
  select('Any', :from=> 'loadType')
end

Given(/^the user clicks view transactions$/) do
  click_on('View Transactions')
end

Then(/^the user should receive a minimum search criteria error$/) do
  expect(page).to have_content('Please correct the following errors:')
end

Given(/^the user selects Program Code "([^"]*)"$/) do |programCode|
  select(programCode, :from=> 'programCode')
end

Given(/^the user selects Transaction type with "([^"]*)"$/) do |transType|
  select(transType, :from=> 'transType')
end

Given(/^the user selects Transaction group with "([^"]*)"$/) do |transGroup|
  select(transGroup, :from=> 'transGroup')
end

Given(/^the user selects academic Year with "([^"]*)"$/) do |academicYear|
  select(academicYear, :from=> 'academicYear')
end

Given(/^the user selects Load type with "([^"]*)"$/) do |loadType|
  select(loadType, :from=> 'loadType')
end

Then(/^the user should receive some results$/) do
  expect(page).to have_css('.customer', :minimum => 1)
end

Given(/^the user attempts to visit the Add user page$/) do
  visit ENV['SERVER']+"/add_customer"
end

Then(/^the libraryCard field should be "([^"]*)"$/) do |libraryCardStatus|
  unless libraryCardStatus == ""
    expect(page).to have_field('libraryCard', disabled: true)
  end
end

Then(/^the userId field should be "([^"]*)"$/) do |userId|
  unless userId == ""
    expect(page).to have_field('userId', disabled: true)
  end
end

Then(/^the accommodationRmNo field should be "([^"]*)"$/) do |accommodationRmNo|
  unless accommodationRmNo == ""
    expect(page).to have_field('accommodationRmNo', disabled: true)
  end
end

Then(/^the projectCode field should be "([^"]*)"$/) do |projectCode|
  unless projectCode == ""
    expect(page).to have_field('projectCode', disabled: true)
  end
end

Then(/^the projectAuthoriser field should be "([^"]*)"$/) do |projectAuthoriser|
  unless projectAuthoriser == ""
    expect(page).to have_field('projectAuthoriser', disabled: true)
  end
end

Then(/^the customerType field should be "([^"]*)"$/) do |customerType|
  unless customerType == ""
    expect(page).to have_select('customerType', selected: customerType)
  end
end

Then(/^the user clicks Add$/) do
  click_on('addOrUpdate')
end

Then(/^the user should receive an error regarding missing Forename, surname and program information$/) do
  expect(page).to have_content('Forename is required')
  expect(page).to have_content('Surname is required')
end

Given(/^the user attempts to visit the Blue Card user and project administration page$/) do
  visit ENV['SERVER']+"/blue_card_user_projects"
end

When(/^the user enters a valid project code$/) do
  fill_in 'project', with: $valid_project_code
end

When(/^the user enters an invalid project code$/) do
  fill_in 'project', with: $invalid_project_code

end

Then(/^an invalid notice should be displayed for the user$/) do
  page.find("body").click
  expect(page).to have_css('.not-valid')
end

When(/^the user enters an invalid project code into the project code field$/) do
  fill_in 'projectCode', with: $invalid_project_code
end

When(/^the user enters a valid project code into the project code field$/) do
  fill_in 'projectCode', with: $valid_project_code
end

When(/^the user enters a valid User ID$/) do
  fill_in 'userId', with: $valid_user_id
end

Then(/^the user clicks add$/) do
  click_on('addUserProjectButton')
end

Then(/^the user should appear in the list of users$/) do
  expect(page).to have_content($valid_user_id, :minimum=> 2)
end

When(/^the user clicks delete against a valid user$/) do
  # find([filter=$valid_project_code])
  find(:xpath, "//tr[contains(@filter, '#{$valid_project_code} #{$valid_user_id}')]//td[@class='account']//button[@class='deleteRecord']").click
  find(:xpath, "//span[contains(text(), 'Delete record')]").click

end

Then(/^the user should no longer appear in the list$/) do
  expect(page).to have_content($valid_user_id, :maximum=> 1)
end

When(/^the user enters "([^"]*)"$/) do |filterValue|
  $filterCountTotal = page.all('.showHide').size
  $filterCountFiltered = page.all(:xpath, "//tr[contains(@filter, '#{filterValue}')]").size
  puts $filterCountFiltered
  fill_in 'filterBy', with: filterValue
end

Then(/^the user should see appropriate results$/) do
  expect(page).to have_css('tr.showHide', :count=> $filterCountFiltered)
end

When(/^the user clicks clear$/) do
  click_on('clearFilter')
end

Then(/^all original list items should appear$/) do
  expect(page).to have_css('tr.showHide', :count=> $filterCountTotal)
end
