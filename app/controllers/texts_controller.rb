class TextsController < ApplicationController
    
  def create
    @text = Text.new(text: params[:message])
    @text.save
    redirect_to '/texts/show'
  end


  
end
