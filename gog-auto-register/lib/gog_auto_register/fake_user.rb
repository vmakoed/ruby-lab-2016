require 'faker'

class FakeUser
  attr_accessor :username, :email, :password

  def initialize
    @username = Faker::Internet.user_name
    @email = Faker::Internet.safe_email
    @password = Faker::Internet.password
  end
end