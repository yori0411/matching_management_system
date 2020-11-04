class HomeController < ApplicationController

  def top
    @user = User.find_by(user_id: session[:login_id])
  end


end