class Api::V1::SessionsController < ApplicationController
  def create
    result = AuthenticationService.call(params[:email], params[:password])

    if result[:success]
      render json: { token: result[:token] }, status: :ok
    else
      render json: { error: result[:error] }, status: :unauthorized
    end
  end
end
