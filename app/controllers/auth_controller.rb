class AuthController < ApplicationController
    before_action :create_form

  def login
  end

  def add_session
    login_user = User.find_by(user_id: params[:administrator][:user_id])
    if login_user && login_user.authenticate(params[:administrator][:password])
      session[:login_user] = login_user
      flash[:notice] = 'ログインしました'
      redirect_to  controller: :home, action: :top
    else
      redirect_to action: :login
    end
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
