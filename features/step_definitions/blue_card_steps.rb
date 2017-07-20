# Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
Capybara.default_driver = :selenium
# Capybara.register_driver :selenium do |app|
#   Capybara::Driver::Selenium.new(app,
#     :browser => :remote,
#     :url => "http://192.168.1.127:4444/wd/hub",
#     :desired_capabilities => :internet_explorer)
# end



###############################################################
##                   FEATURE: CAS LOGIN                      ##
##      Check that you're redirected to CAS to log in        ##
###############################################################

###############################################################
##              Scenario: Visit main application             ##
###############################################################

Given (/^I visit the Blue Card Portal/) do
 visit "https://www.bath.ac.uk/accommodation/bluecardportal/accounts_home"
end

Then (/^I should redirect to the cas login$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
end

###############################################################
## Scenario: I visit a specific transaction to add a comment ##
###############################################################

Given (/^I visit a specific transaction to add a comment/) do
  visit "https://www.bath.ac.uk/accommodation/bluecardportal/transaction_comment?accountTransactionId=2144009&description=+Chk%3a+32965&location=Lime+Tree&accountPosRef=16000001"
end

Then (/^I should redirect to the cas login page$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
  expect(page).to have_no_content "Blue Card"
end

###############################################################
## Scenario: I visit the delete account button for account   ##
##                    Without logging in                     ##
###############################################################

Given (/^I visit the delete page for a specific account/) do
  visit ""
end

###############################################################
##                 FEATURE: ACCOUNT CHECK                    ##
##   Check that an account has visibility of project codes   ##
###############################################################

Given (/^Given I visit the Blue Card Portal and log in/) do
 visit "https://www.bath.ac.uk/accommodation/bluecardportal/accounts_home"
end

When(/^I log in at the cas redirect page$/) do
  within('#header') { expect(page).to have_content('Single Sign-on') }
  fill_in 'username', :with => $username
  fill_in 'password', :with => $cyfrinair
  if Capybara.default_driver = :selenium
    page.
  # page.save_screenshot('')
  find(".btn-submit").click
end
Then (/^I should shown the Blue Card Administration Page$/) do
  expect(page).to have_title "Blue Card Admin | University of Bath"
  expect(page).to have_no_content('Unfortunately we can not find an active Blue Card account for card number')
end
