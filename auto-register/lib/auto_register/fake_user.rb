require 'faker'
require 'fileutils'

class FakeUser
  attr_accessor :username, :email, :password

  def initialize
    @username = Faker::Internet.user_name
    @email = Faker::Internet.safe_email
    @password = Faker::Internet.password
  end

  def save_to_csv(file_path)
    FileUtils.touch(file_path)
    File.open(file_path, "ab") do |csv|
      csv << "Username:\t#{@username}\nEmail:\t#{@email}\nPassword:\t#{@password}\n\n"
    end
  end
end
