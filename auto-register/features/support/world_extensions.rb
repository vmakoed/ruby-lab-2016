$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'auto_register'

module RegistrationHelper
  def generate_user(user_id)
    AutoRegister.create_fake_user(user_id)
  end

  def visit_homepage
    visit 'http://site-maker.herokuapp.com/'
  end

  def invoke_registration_form
    page.click_link('Sign up')
  end

  def fill_in_user_info(user_info)
    page.fill_in('user_name', with: user_info.username)
    page.fill_in('user_email', with: user_info.email)
    page.fill_in('user_password', with: user_info.password)
    page.fill_in('user_password_confirmation', with: user_info.password)
  end

  def click_confirm_sign_up_button
    page.click_button('Sign up')
  end

  def log_out
    page.click_link('Log out')
  end

  def save_user_credentials_to_file(user_info)
    path_to_file = Pathname(__FILE__).dirname.parent.parent + 'users.csv'
    AutoRegister.save_user_info_to_csv(user_info, (path_to_file))
  end

  def register_fake_user(user_id)
    user_info = generate_user(user_id)
    visit_homepage
    invoke_registration_form
    fill_in_user_info(user_info)
    click_confirm_sign_up_button
    log_out
    save_user_credentials_to_file(user_info)
  end
end

World(RegistrationHelper)
