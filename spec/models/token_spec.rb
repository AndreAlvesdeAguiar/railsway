require 'rails_helper'

describe Token do
  context '#create' do
    it 'create token' do
      token =
        Token.create!(key: SecureRandom.base64(150), expiration: 1.day.from_now)
      expect(token).to be_present
    end
  end

  context '#update' do
    let!(:token) do
      create(:token, key: SecureRandom.base64(150), expiration: 1.day.from_now)
    end

    it 'update values' do
      token.update(key: '12345')

      expect(token.reload.key).to eq('12345')
    end
  end
end
