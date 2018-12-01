FactoryBot.define do
  factory :product do
    name { Faker::FunnyName.name }
    association :brand
  end
end