class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :details]

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
    @user = User.find_by(user_id: params[:user_id])
  end

  # GET /users/1/edit
  def edit_plf
    @user = User.find_by(user_id: session[:login_id])
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
    users = User.where.not(user_id: session[:login_id], authority: 1)
    user1 = User.find_by(user_id: session[:login_id])
    if params[:check_count].present?
      check_count = params[:check_count].to_i
    else
      check_count = 0
    end
    @users = []
    users.each do |user2|
      if matching_check(user1, user2, check_count) && (Room.where(user_id1: user1.user_id, user_id2: user2.user_id).or(Room.where(user_id1: user2.user_id, user_id2: user1.user_id))).blank?
        @users << user2 
      end
    end
  end

  def add_friend
    #友達追加処理（roomの作成）
    @room = Room.new(user_id1: session[:login_id], user_id2: params[:user_id])
    @room.save

    #トップ画面へ
    redirect_to root_path
  end

  def details
#   @user = User.where("name='test'")
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
  #マッチング確認用メソッド
#引数（3）：ログインユーザーデータ、相手ユーザー、マッチ条件数
#マッチすればtrue、しなければfalseを返す。
def matching_check(user1, user2, check_count)
  count = 0
  if user1.q1 == user2.q1
      count += 1
  end
  if user1.q2 == user2.q2
      count += 1
  end
  if user1.q3 == user2.q3
      count += 1
  end
  if user1.q4 == user2.q4
      count += 1
  end
  if user1.q5 == user2.q5
      count += 1
  end
  if user1.q6 == user2.q6
      count += 1
  end
  if user1.q7 == user2.q7
      count += 1
  end
  if user1.q8 == user2.q8
      count += 1
  end
  if user1.q9 == user2.q9
      count += 1
  end
  if user1.q10 == user2.q10
      count += 1
  end
  if user1.q11 == user2.q11
      count += 1
  end
  if user1.q12 == user2.q12
      count += 1
  end
  if count >= check_count
      return true
  else
      return false
  end
end
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