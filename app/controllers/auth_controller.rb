class AuthController < ApplicationController
  before_action :create_form

  def login
  end

  def add_session
    login_user = User.find_by(user_id: params[:user][:user_id])
    # if login_user && login_user.authenticate(params[:user][:password])
    if login_user && (login_user.password == params[:user][:password])
      session[:login_id] = login_user.user_id
      flash[:notice] = 'ログインしました'
      if login_user.authority == 1
        redirect_to  controller: :users, action: :index
      else login_user.authority == 0
       redirect_to  controller: :home, action: :top
      end
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
    @form = User.new
  end
end