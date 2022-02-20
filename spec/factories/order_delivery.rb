FactoryBot.define do
  factory :order_delivery do
    post_code { '123-1234' }
    address_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    house_number { Faker::Address.zip }
    building { 'あああマンション' }
    tel { '09011111111' }
  end
end
