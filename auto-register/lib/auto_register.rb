require 'auto_register/fake_user'

module AutoRegister
  def AutoRegister.create_fake_user
    FakeUser.new
  end

  def AutoRegister.save_user_info_to_csv(fake_user, file_path)
    fake_user.save_to_csv(file_path)
  end
end
