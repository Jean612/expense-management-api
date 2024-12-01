require 'rails_helper'

RSpec.describe 'API Token Middleware', type: :request do
  let(:valid_token) { ENV['API_TOKEN'] }
  let(:invalid_token) { 'invalid' }

  it 'allows requests with a valid token' do
    get '/api/v1/login', headers: { 'API_TOKEN' => valid_token }
    expect(response).not_to have_http_status(:unauthorized)
  end

  it 'reject requests with a invalid token' do
    get '/api/v1/login', headers: { 'API_TOKEN' => invalid_token }
    expect(response).to have_http_status(:unauthorized)
  end
end
