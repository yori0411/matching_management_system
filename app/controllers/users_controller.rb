class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1
  # GET /users/1.json
  def show_plf
    @user = User.find_by(password: "1234", name: "test", gender: 0, user_id: "bbbb", authority: 0)
  end

  # GET /users/1/edit
  def edit_plf
    @user = User.find_by(password: "1234", name: "test", gender: 0, user_id: "bbbb", authority: 0)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.attributes = user_params
    #画像を指定した場合
    if params[:user][:filename].present?
      @user.filename = DateTime.now.strftime('%Y%m%d%H%M%S') + params[:user][:filename].original_filename

      File.open("app/assets/images/#{@user.filename}",'w+b') {|f|
       f.write(params[:user][:filename].read)
      }
    end

    respond_to do |format|
      if @user.save(user_params)
        if params[:student_plf]
          #生徒用のプロフィール編集完了
          format.html { redirect_to controller: 'home', action: 'top', notice: 'User was successfully updated.' }
        else
          #先生用のユーザ編集完了
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        end
       else
        if params[:student_plf]
          #生徒用のプロフィール編集完了
          format.html { render :edit_plf}
        else
          #先生用のユーザ編集完了
          format.html { render :edit }
        end
      end
    end
  end

  #プロフィールもいる？
  def create_plf
    @user = User.new(user_params)
     #画像を指定した場合
     if params[:user][:filename].present?
      @user.filename = DateTime.now.strftime('%Y%m%d%H%M%S') + params[:user][:filename].original_filename
 
       File.open("app/assets/images/#{@user.filename}",'w+b') {|f|
       f.write(params[:user][:filename].read)
       }
     end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update_plf
    @user.attributes  = user_params
    #画像を指定した場合
    if params[:user][:filename].present?
      @user.filename = DateTime.now.strftime('%Y%m%d%H%M%S') + params[:user][:filename].original_filename
 
       File.open("app/assets/images/#{@user.filename}",'w+b') {|f|
       f.write(params[:user][:filename].read)
       }
     end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
       else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def matching
    @users = User.all
  end

  def details
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.require(:user).permit(:password, :password_confirmation, :name, :gender, :filename, :user_id, :authority, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12)
      params.require(:user).permit(:password, :name, :gender, :filename, :user_id, :authority, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12)
    end
end
