require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    @user = create(:user, email: 'user@example.com', password: 'password123')
  end

  let(:valid_token) { ENV['API_TOKEN'] }
  let(:json_response) { JSON.parse(response.body) }

  describe 'POST /api/v1/login' do
    context 'when credentials are valid' do
      it 'returns a JWT token' do
        post '/api/v1/login', headers: { 'API_TOKEN' => valid_token }, params: { email: 'user@example.com', password: 'password123' }

        expect(json_response['token']).to be_a(String)
      end

      it 'returns status ok' do
        post '/api/v1/login', params: { email: 'user@example.com', password: 'password123' }, headers: { 'API_TOKEN' => valid_token }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when credentials are invalid' do
      it 'returns an unauthorized error' do
        post '/api/v1/login', params: { email: 'user@example.com', password: 'wrongpassword' }, headers: { 'API_TOKEN' => valid_token }

        expect(json_response['error']).to eq('Invalid email or password')
      end

      it 'returns an unauthorized status' do
        post '/api/v1/login', params: { email: 'user@example.com', password: 'wrongpassword' }, headers: { 'API_TOKEN' => valid_token }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
