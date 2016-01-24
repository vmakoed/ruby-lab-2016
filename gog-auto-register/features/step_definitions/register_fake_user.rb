require 'faker'

Given(/^I am on GOG homepage$/) do
  visit "http://www.gog.com/"
end

Then(/^I will invoke registration form$/) do
  find('.top-nav-login-btn--signup').click
end

Then(/^I should see registration form$/) do
  page.driver.browser.switch_to.frame 'GalaxyAccountsFrame'
  page.should have_css('form[name="register"]')
end

Then(/^I will fill fake credentials$/) do
  page.fill_in('register[username]', with: Faker::Internet.user_name)
  page.fill_in('register[email]', with: Faker::Internet::safe_email)
  page.fill_in('register[password]', with: Faker::Internet::password)
end

Then(/^I will click the sign up button$/) do
  page.click_button('register_register')
end

