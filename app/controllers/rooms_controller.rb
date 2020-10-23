class RoomsController < ApplicationController
  def show
    @texts = Text.all
  end
  def create
    @texts = Text.new(text.params[:message])
    @texts.save
  end
end
