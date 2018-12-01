FactoryBot.define do
  factory :customer do
    name        { Faker::Name.name }
    phone       { Faker::PhoneNumber }
    address     { Faker::Address }
  end
end