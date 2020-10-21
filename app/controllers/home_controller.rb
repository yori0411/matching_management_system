class HomeController < ApplicationController
  def top
    @text = Text.all
  end
  def create
    @text = Text.new(text: params[:message])
    @text.save
    redirect_to '/'
  end
  
end
