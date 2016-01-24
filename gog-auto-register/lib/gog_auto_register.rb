require 'gog_auto_register/fake_user'

module GOGAutoRegister
  def GOGAutoRegister.create_fake_user
    FakeUser.new
  end
end