class SessionsController < ApplicationController

  def new
    redirect_to user_omniauth_authorize_path(:facebook)
  end

  def destroy
  end
end
