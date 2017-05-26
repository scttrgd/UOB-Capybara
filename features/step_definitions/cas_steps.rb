require 'capybara/cucumber'
Capybara.default_driver = :selenium

Given (/^I visit the Blue Card Portal/) do
 visit "https://www.bath.ac.uk/accommodation/bluecardportal/accounts_home"
end

Then (/^I should redirect to the cas login$/) do
  expect(page).to have_title "University of Bath Single Sign-on"
end
