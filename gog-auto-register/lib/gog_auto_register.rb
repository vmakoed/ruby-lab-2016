require 'gog_auto_register/fake_user'

module GOGAutoRegister
  def GOGAutoRegister.create_fake_user
    FakeUser.new
  end

  def GOGAutoRegister.save_user_info_to_csv(fake_user, file_path)
    fake_user.save_to_csv(file_path)
  end
end
