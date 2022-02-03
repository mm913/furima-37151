FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"テスト"}
    first_name {"太郎"}
    family_name_kana {"テスト"}
    first_name_kana {"タロウ"}
    birthday  {Faker::Date.birthday(min_age: 5, max_age: 92)}
  end
end
