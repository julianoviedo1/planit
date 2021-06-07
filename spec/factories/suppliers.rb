FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    descrption { Faker::Company.catch_phrase }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.cell_phone_with_country_code }
    delivery { Faker::Boolean.boolean(true_ratio: 0.5) }
    offers { 'Desayunos, almuerzos, dulces' }
    opens_at { Faker::Number.between(from: 0, to: 23) }
    close_at { Faker::Number.between(from: 0, to: 23) }
  end
end