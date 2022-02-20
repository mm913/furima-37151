FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    address_id { Faker::Number.between(from: 2, to: 48) }
    delivery_days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
