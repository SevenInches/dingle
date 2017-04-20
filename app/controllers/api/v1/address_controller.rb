class Api::V1::AddressController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :get_address, :only =>[:show, :update, :destroy]

  swagger_controller :app_api, "App Api"
  swagger_api :index do
    summary "收货地址列表"
    param :header, :Authorization, :string, :required, "token验证"
  end
  swagger_api :create do
    summary "新建收货地址"
    param :header, :Authorization, :string, :required, "token验证"
  end
  swagger_api :show do
    summary "编辑收货地址"
    param :header, :Authorization, :string, :required, "token验证"
    param :path, :id, :integer, :optional, "收货地址Id"
  end
  swagger_api :update do
    summary "更新收货地址"
    param :header, :Authorization, :string, :required, "token验证"
    param :path, :id, :integer, :optional, "收货地址Id"
  end
  swagger_api :destroy do
    summary "删除收货地址"
    param :header, :Authorization, :string, :required, "token验证"
    param :path, :id, :integer, :optional, "收货地址Id"
  end


  def index
    @addresses = current_user.addresses
  end

  def create
    @addrss = Address.create(address_params)
    if @address.update(user_id: current_user.id)
      return render json:{status: :success,  msg: '添加地址成功'}
    else
      return api_error('添加地址失败')
    end
  end

  def show

  end

  def update
    if @address.update(address_params)
      return render json:{status: :success,  msg: '修改成功'}
    else
      return api_error('修改失败')
    end
  end

  def destroy
    if @address.delete
      return render json:{status: :success,  msg: '删除成功'}
    else
      return api_error('删除失败')
    end
  end

  private
  def address_params
    params.permit(:name, :gender, :phonecall,  :address, :tag)
  end

  def get_address
    @address = Address.find(params[:id])
    unless @address.present?
      return api_error('地址不存在')
    end
  end
end