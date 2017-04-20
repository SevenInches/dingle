class Api::V1::OrdersController < Api::V1::BaseController
  before_action :authenticate_user!

  swagger_controller :app_api, "App Api"
  swagger_api :index do
    summary "订单列表"
    param :header, :Authorization, :string, :required, "token验证"
    param :query, :page, :integer, :optional, "页数"
  end


  def index
    @orders = current_user.orders
  end

  def create

  end
end