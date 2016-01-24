require 'faker'
require 'fileutils'

class FakeUser
  attr_accessor :username, :email, :password, :id

  def initialize(id)
    @username = Faker::Internet.user_name
    @email = Faker::Internet.safe_email
    @password = Faker::Internet.password
    @id = id
  end

  def save_to_csv(file_path)
    FileUtils.touch(file_path)
    File.open(file_path, "ab") do |csv|
      csv << "##{@id}\nUsername:\t\t#{@username}\nEmail:\t\t\t#{@email}\nPassword:\t\t#{@password}\n"
      csv << "Recording time:\t#{Time.now}\n\n"
    end
  end
end
