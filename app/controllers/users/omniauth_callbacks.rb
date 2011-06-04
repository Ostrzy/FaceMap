class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env['omniauth.auth']
    render auth.to_yaml
    #@user = User.find_for_omniauth(auth['uid'], auth['provider'], auth['extra']['user_hash'])

    #if @user.persisted?
    #  sign_in @user
    #  redirect_to @user
    #else
    #  redirect_to new_user_session
    #end
  end
end

