$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'gog_auto_register'

module RegistrationHelper
  def register_fake_user
    user_info = RegistrationHelper.generate_user
    invoke_registration_form
    switch_to_registration_form
    fill_in_user_info(user_info)
    click_confirm_sign_up_button
    save_user_credentials_to_file(user_info)
  end

  def generate_user
    GOGAutoRegister.create_fake_user
  end

  def visit_homepage
    visit 'http://www.gog.com/'
  end

  def invoke_registration_form
    find('.top-nav-login-btn--signup').click
  end

  def switch_to_registration_form
    page.driver.browser.switch_to.frame 'GalaxyAccountsFrame'
  end

  def fill_in_user_info(user_info)
    page.fill_in('register[username]', with: user_info.username)
    page.fill_in('register[email]', with: user_info.email)
    page.fill_in('register[password]', with: user_info.password)
  end

  def click_confirm_sign_up_button
    page.click_button('register_register')
  end

  def save_user_credentials_to_file(user_info)
    path_to_file = Pathname(__FILE__).dirname.parent.parent + 'users.csv'
    GOGAutoRegister.save_user_info_to_csv(user_info, (path_to_file))
  end
end

World(RegistrationHelper)
