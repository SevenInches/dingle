class Api::V1::TradersController < Api::V1::BaseController
  swagger_controller :app_api, "App Api"
  swagger_api :index do
    summary "商家列表"
    param :query, :page, :integer, :optional, "页数"
  end

  def index
    @traders = Trader.where(status: Trader::OPEN_STATUS).where("open_time > ? and close_time < ?", Time.now)
    @traders.paginate(:page => params[:page], :per_page => 20)
  end
  

end