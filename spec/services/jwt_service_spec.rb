require 'rails_helper'

RSpec.describe JwtService, type: :service do
  let(:payload) { { user_id: 1 } }
  let(:token) { described_class.encode(payload) }

  it 'encodes a payload into a token' do
    expect(token).to be_a(String)
  end

  it 'decodes a valid token' do
    decoded = described_class.decode(token)
    expect(decoded[:user_id]).to eq(1)
  end

  it 'returns nil for an invalid token' do
    expect(described_class.decode('invalid_token')).to be_nil
  end
end
