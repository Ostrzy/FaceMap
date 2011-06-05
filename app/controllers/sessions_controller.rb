class SessionsController < ApplicationController

  def new
    if current_user
      render 'users/show'
    else
      redirect_to user_omniauth_authorize_path(:facebook)
    end
  end

  def destroy
    sign_out current_user if current_user
    flash[:notice] = I18n.t('devise.sessions.signed_out')
  end
end
