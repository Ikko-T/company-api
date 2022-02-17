FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { rand(0..120) }
    company { Faker::Company.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    twitter { "@#{first_name}".downcase }
    message { Faker::Lorem.paragraph }
    gender { rand(0..2) }
  end
end
