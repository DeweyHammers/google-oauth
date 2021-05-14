class User < ApplicationRecord
  has_secure_password

  def self.create_from_omniauth(auth)
    self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
      user.username = auth['info']['first_name']
      user.email = auth['info']['email']
      user.password = SecureRandom.hex(16)
    end
  end
end
