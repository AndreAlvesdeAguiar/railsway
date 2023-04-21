FactoryBot.define do
  factory :token do
    key { SecureRandom.base64(150) }
    expiration { 1.day.from_now }
  end
end
