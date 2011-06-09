class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :name, :location

  def self.find_for_omniauth auth
    user_data = auth['extra']['user_hash']
    if user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
      [user, user.update_attributes(:name => user_data['name'], :location => user_data['location'].try(:[], 'name'))]
    else
      User.create do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.name = user_data['name']
        user.location = user_data['location']['name']
        user.picture = auth['user_info']['image'].gsub(/square/, 'large')
      end
    end
  end
end
