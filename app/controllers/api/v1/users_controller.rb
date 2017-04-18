class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, :except=>[:create]
  before_action :get_user, :only =>[:show, :update, :update_avatar]

  def create
    @user = User.create(:phone => params[:phone], :password => params[:password], :source => params[:source])
    if @user.errors.count > 0
      return api_error(@user.errors.full_messages[0])
    end
  end

  def show
  end

  def update
    @user.update(nickname: params[:nickname]) if params[:nickname].present?
    @user.update(password: params[:password]) if params[:password].present?
    render JSON:{status: :success, msg: '修改成功'}
  end

  def update_avatar
    if params[:avatar].present?
      avatar = QiNiu.uploaderImage("avatars/#{@user.id}/avatar.jpg", params[:avatar].tempfile)
      if @user.update(avatar: avatar)
        return render :json => {status: :success, msg: '上传头像成功', avatar_url: avatar}.to_json
      end
    end
    return api_error('参数错误')
  end

  private
    def get_user
      @user = current_user
    end
  
end