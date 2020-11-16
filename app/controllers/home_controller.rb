class HomeController < ApplicationController

  def top
    @user = User.find_by(user_id: session[:login_id])
    @rooms = Room.where(user_id1: session[:login_id]).or(Room.where(user_id2: session[:login_id]))
  end

  


end