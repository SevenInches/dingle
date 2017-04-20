class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, :except=>[:create, :login]
  before_action :get_user, :only =>[:show, :update, :update_avatar]

  swagger_controller :app_api, "App Api"
  swagger_api :create do
    summary "注册"
    param :form, :phone, :string, :required, "手机号"
    param :form, :password, :string, :required, "密码"
    param :form, :source, :string, :required, "来源: {0: WeChat, 1: iOS, 2: Android, 3: web}"
  end
  swagger_api :show do
    summary "个人消息"
    param :header, :Authorization, :string, :required, "token验证"
  end
  swagger_api :update do
    summary "修改密码/修改昵称"
    param :header, :Authorization, :string, :required, "token验证"
    param :form, :nickname, :string, :optional, "昵称"
    param :form, :password, :string, :optional, "密码"
  end
  swagger_api :update_avatar do
    summary "更新头像"
    param :header, :Authorization, :string, :required, "token验证"
    param :form, :avatar, :file, :required, "头像"
  end
  swagger_api :login do
    summary "登录"
    param :form, :phone, :string, :required, "手机号"
    param :form, :password, :string, :required, "密码"
  end
  swagger_api :logout do
    summary "登出"
    param :header, :Authorization, :string, :required, "token验证"
  end

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

  def login
    @user = User.find_by(phone: params[:phone])
    if @user.present? and @subscriber.authenticate(params[:password])
      @user.reset_token!
      self.current_user = @user
      return render 'api/v1/users/show'
    elsif @user.nil?
      return api_error('用户不存在')
    else
      return api_error('密码错误')
    end
  end

  def logout
    User.find(self.current_user.id).reset_token!
    self.current_user = nil
    render json: {status: 'success', msg: '退出登录'}.to_json
  end

  private
    def get_user
      @user = current_user
    end
end