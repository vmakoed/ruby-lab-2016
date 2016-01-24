$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'gog_auto_register'

user_info = GOGAutoRegister.create_fake_user

Given(/^I am on GOG homepage$/) do
  visit_homepage
end

Then(/^I will invoke registration form$/) do
  invoke_registration_form
end

Then(/^I should see registration form$/) do
  switch_to_registration_form
  page.should have_css('form[name="register"]')
end

Then(/^I will fill fake credentials$/) do
  fill_in_user_info(user_info)
end

Then(/^I will click the sign up button$/) do
  click_confirm_sign_up_button
end

Then(/^I will save user credentials to a file$/) do
  save_user_credentials_to_file(user_info)
end
