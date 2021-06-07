FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    address { Faker::Address.full_address }
    phone_number { Faker::Number.number(digits: 12) }
    delivery { Faker::Boolean.boolean(true_ratio: 0.5) }
    offers { 'Desayunos, almuerzos, dulces' }
    opens_at { Faker::Number.between(from: 0, to: 23) }
    close_at { Faker::Number.between(from: 0, to: 23) }
  end

  factory :supplier_with_category do
    after(:create) do |supplier|
      create(:category, supplier: supplier)
    end
  end

  factory :supplier_with_service do
    after(:create) do |supplier|
      create(:service, supplier: supplier)
    end
  end
end