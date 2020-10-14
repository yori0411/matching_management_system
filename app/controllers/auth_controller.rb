class AuthController < ApplicationController
    before_action :create_form

  def login
    if session[:user]
      flash[:notice] = 'ログインしました'
      redirect_to users_path
    else
      render :login
    end
  end

  def add_session
    admin = User_id.find_by(User_id: params[:administrator][:User_id])
    if admin && admin.authenticate(params[:administrator][:password])
      session[:user] = user
    end
    redirect_to action: :login
  end

  def logout
    reset_session
    flash[:notice] = 'ログアウトしました'
    redirect_to action: :login
  end
  
  private
  
  def create_form
    @form = Administrator.new
  end
end
