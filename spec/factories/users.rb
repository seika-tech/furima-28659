FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    encrypted_password    {password}
    birth_date            {"1992-12-27"}
    last_name             {"世翔"}
    first_name            {"三船"}
    last_name_kana        {"セイカ"}
    first_name_kana       {"ミフネ"} 
  end
end
