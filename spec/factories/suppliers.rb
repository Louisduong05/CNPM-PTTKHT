FactoryBot.define do
  factory :supplier do
    name        { Faker::Name.name }
    phone       { Faker::PhoneNumber }
    address     { Faker::Address }
  end
end