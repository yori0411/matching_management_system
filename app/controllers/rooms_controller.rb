class RoomsController < ApplicationController
  def show
    @texts = Text.all
  end
  def create
    @texts = Text.new(text: params[:message], user_id: "s20181435", partner_id: "s20181436")
    #logger.debug("=================")
    #logger.debug(@texts.inspect)
    @texts.save
    redirect_to '/rooms/show'
  end
end
