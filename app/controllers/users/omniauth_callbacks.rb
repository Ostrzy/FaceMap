class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env['omniauth.auth']
    user = User.find_for_omniauth auth

    if user.persisted?
      sign_in_and_redirect user
    else
      render :text => I18n.t(:log_failure)
    end
  end
end

