class HomeController < ApplicationController

  def top
    @user = User.find_by(user_id: session[:login_id])
    @rooms = Room.where(user_id1: session[:login_id]).or(Room.where(user_id2: session[:login_id]))
    @user_list = []
    @rooms.each do |room|
      if room.user_id1 == session[:login_id]
        user = User.find_by(user_id: room.user_id2)
        user_id = user.user_id
        name = user.name
        if name
          @user_list << name
        else
          @user_list << user_id
        end
      else
        user = User.find_by(user_id: room.user_id1)
        user_id = user.user_id
        name = user.name
        if name
          @user_list << name
        else
          @user_list << user_id
        end
      end
    end
    logger.debug("=======list=======")
    logger.debug(@user_list)
  end

  


end