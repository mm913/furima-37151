FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    category { Category.all.sample }
    condition { Condition.all.sample }
    delivery_charge { DeliveryCharge.all.sample }
    address { Address.all.sample }
    delivery_days { DeliveryDays.all.sample }
    price { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end
end
