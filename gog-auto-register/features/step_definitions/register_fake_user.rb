$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'gog_auto_register'

Given(/^I am on GOG homepage$/) do
  visit 'http://www.gog.com/'
end

Then(/^I will invoke registration form$/) do
  find('.top-nav-login-btn--signup').click
end

Then(/^I should see registration form$/) do
  page.driver.browser.switch_to.frame 'GalaxyAccountsFrame'
  page.should have_css('form[name="register"]')
end

Then(/^I will fill fake credentials$/) do
  user_info = GOGAutoRegister.create_fake_user
  page.fill_in('register[username]', with: user_info.username)
  page.fill_in('register[email]', with: user_info.email)
  page.fill_in('register[password]', with: user_info.password)
end

Then(/^I will click the sign up button$/) do
  page.click_button('register_register')
end
