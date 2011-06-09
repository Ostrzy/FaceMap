class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env['omniauth.auth']
    user, up_succ = User.find_for_omniauth auth

    if user.persisted?
      flash[:notice] = I18n.t(:update_failure) unless up_succ
      sign_in_and_redirect user
    else
      render :text => I18n.t(:log_failure)
    end
  end
end

