class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token.blank?
      render json: { error: 'Missing Authorization Token' }, status: :unauthorized
      return
    end

    begin
      decoded_token = JwtService.decode(token) # Decodifica el token usando tu servicio
      @current_user = User.find_by(id: decoded_token[:user_id])
      render json: { error: 'Invalid Token or User Not Found' }, status: :unauthorized if @current_user.nil?
    rescue JWT::ExpiredSignature
      render json: { error: 'Token Expired' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { error: 'Invalid Token' }, status: :unauthorized
    end
  end

  attr_reader :current_user
end
