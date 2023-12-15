FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address{ 'test@test' }
    phone_number { '08009998888' }
    building { '東京ハイツ' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
