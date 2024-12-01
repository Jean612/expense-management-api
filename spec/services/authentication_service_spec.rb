require 'rails_helper'

RSpec.describe AuthenticationService, type: :service do
  before do
    @user = create(:user, email: 'user@example.com', password: 'password123')
  end

  describe '.call' do
    context 'when the credentials are valid' do
      it 'returns a token' do
        result = described_class.call('user@example.com', 'password123')

        expect(result[:token]).to be_a(String)
      end

      it 'returns success result' do
        result = described_class.call('user@example.com', 'password123')

        expect(result[:success]).to be(true)
      end
    end

    context 'when the credentials are invalid' do
      it 'returns an error' do
        result = described_class.call('user@example.com', 'wrongpassword')

        expect(result[:error]).to eq('Invalid email or password')
      end

      it 'returns success result with false' do
        result = described_class.call('user@example.com', 'wrongpassword')

        expect(result[:success]).to be(false)
      end
    end
  end
end
