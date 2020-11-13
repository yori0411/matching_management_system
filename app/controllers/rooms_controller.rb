class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def show
    #@room = Room.find(params[:id])
    @texts = Text.where(room_id: @room.id)
  end

  def create_text
    @room = Room.find(params[:id])
    @text = Text.new(text: params[:message], room_id: @room.id)
    logger.debug("=================")
    logger.debug(@text.inspect)
    @text.save
    redirect_to @room
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(user_params)
        format.html { redirect_to :index, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      # params.require(:user).permit(:password, :password_confirmation, :name, :gender, :filename, :user_id, :authority, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12)
      params.require(:room).permit(:user_id1, :user_id2, :room_id)
    end
end
