class LoginController < ApplicationController
  layout "blank"
  skip_before_filter :authorize

  def login
  end

  def do_login
    session[:user_id]=1
    redirect_to('/home')
  end

end
