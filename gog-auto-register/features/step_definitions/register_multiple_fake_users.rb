$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../lib"

require 'gog_auto_register'

Then(/^I will register "(^[0-9]*$)" fake users$/) do |number_of_users|
  number_of_users.to_i.times do
    register_fake_user
  end
end
