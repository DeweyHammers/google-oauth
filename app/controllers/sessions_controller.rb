class SessionsController < ApplicationController
  def omniauth
    user = User.create_from_omniauth(auth)
   
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :root
    end
  end

  private 

  def auth
    request.env['omniauth.auth']
  end
end