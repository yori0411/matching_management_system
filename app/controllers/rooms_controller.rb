class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def show
    @texts = Text.all
  end

  def create_text
    @texts = Text.new(text: params[:message], user_id: "s20181435", partner_id: "s20181436")
    #logger.debug("=================")
    #logger.debug(@texts.inspect)
    @texts.save
    redirect_to '/rooms/show'
  end

  def index
    @rooms = Room.all
  end

  def new
    @rooms = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to :index, notice: 'Room was successfully created.' }
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
        format.json { render :show, status: :ok, location: @user }
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
