$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'auto_register'

user_info = AutoRegister.create_fake_user

Given(/^I am on SiteMaker homepage$/) do
  visit_homepage
end

Then(/^I will invoke registration form$/) do
  invoke_registration_form
end

Then(/^I should see registration form$/) do
  page.should have_css('input[id="user_name"]')
end

Then(/^I will fill fake credentials$/) do
  fill_in_user_info(user_info)
end

Then(/^I will click the sign up button$/) do
  click_confirm_sign_up_button
end

Then(/^I will log out$/) do
  log_out
end

Then(/^I will save user credentials to a file$/) do
  save_user_credentials_to_file(user_info)
end
