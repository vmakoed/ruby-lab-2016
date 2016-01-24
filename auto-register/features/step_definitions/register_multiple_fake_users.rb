$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'auto_register'

Then(/^I will register "([^"]*)" fake users$/) do |number_of_users|
  number_of_users.to_i.times do |user_number|
    register_fake_user(user_number)
  end
end
