FactoryBot.define do
  factory :service do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.between(from: 1, to: 10000) }
    supplier
  end
end