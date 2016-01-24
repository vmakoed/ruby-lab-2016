require 'faker'
require 'fileutils'

class FakeUser
  attr_accessor :username, :email, :password, :id

  def initialize(id = -1)
    @username = Faker::Internet.user_name
    @email = Faker::Internet.safe_email
    @password = Faker::Internet.password
    @id = id
  end

  def save_to_csv(file_path)
    FileUtils.touch(file_path)
    File.open(file_path, "ab") do |csv|
      csv << "##{@id}\nUsername:\t#{@username}\nEmail:\t#{@email}\nPassword:\t#{@password}\n"
      csv << "Record time: #{Time.now}\n\n"
    end
  end
end
