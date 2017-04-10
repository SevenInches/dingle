class Api::V1::UsersController < Api::V1::BaseController

  def create
    @user = User.create(:phone => params[:phone], :password => params[:password], :source => params[:source])
    if @user.errors.count > 0
      return api_error(@user.errors.full_messages[0])
    end
  end

  def show
    @user = User.find(self.current_user.id)
  end

  def update
    @user = User.find(self.current_user.id)
    @user.update(nickname: params[:nickname]) if params[:nickname].present?
    @user.update(password: params[:password]) if params[:password].present?
  end

  def update_avatar
    if params[:avatar].present?

    end
  end
  
end