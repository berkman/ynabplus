class User < ActiveRecord::Base
  has_many :budgets

  def self.from_omniauth(auth, uid)
    where(provider: auth.provider, uid: uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = uid
#      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
