class AuthController < ApplicationController
  before_action :create_form

  def login
  end

  def add_session
    admin = User.find_by(user_id: params[:user][:user_id])
    if admin && admin.authenticate(params[:user][:password])
      flash[:notice] = 'ログインしました'
      session[:admin_id] = admin.user_id
      redirect_to action: :top
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