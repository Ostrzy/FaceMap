class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :uid, :provider

  def self.find_for_omniauth uid, provider, auth
    user_data = auth['extra']['user_hash']
    User.find_by_provider_and_uid(provider, uid) || User.create do |user|
      user.provider = provider
      user.uid = uid
      user.name = user_data['name']
      user.location = user_data['location']['name']
      user.picture = auth['user_info']['image'].gsub(/square/, 'normal')
    end
  end
end
