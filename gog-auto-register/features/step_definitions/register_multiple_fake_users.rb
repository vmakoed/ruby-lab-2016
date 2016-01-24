$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'gog_auto_register'

Then(/^I will register "([^"]*)" fake users$/) do |number_of_users|
  number_of_users.to_i.times do
    user_info = GOGAutoRegister.create_fake_user
    visit 'http://www.gog.com/'
    find('.top-nav-login-btn--signup').click
    page.driver.browser.switch_to.frame 'GalaxyAccountsFrame'
    page.fill_in('register[username]', with: user_info.username)
    page.fill_in('register[email]', with: user_info.email)
    page.fill_in('register[password]', with: user_info.password)
    page.click_button('register_register')
    path_to_file = Pathname(__FILE__).dirname.parent.parent + 'users.csv'
    GOGAutoRegister.save_user_info_to_csv(user_info, path_to_file)
  end
end
