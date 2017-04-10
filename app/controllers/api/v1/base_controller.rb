class Api::V1::BaseController < ActionController::Base
  attr_accessor :current_user

  respond_to :json

  protect_from_forgery with: :null_session

  before_action :destroy_session

  skip_before_action :verify_token

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts)
    render json: { status: 'failure', msg: opts }
  end

  def token_invalid
    render json: { status: 'failure', code: 701 }
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    user_phone = options.blank? ? nil : options[:phone]
    user = user_phone && User.find_by(phone: user_phone)
    if user && ActiveSupport::SecurityUtils.secure_compare(user.token, token)
      self.current_user = user
    else
      return token_invalid
    end
  end

end
