FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.unique.name }
    email { "#{last_name.delete(' ')}@email.com" }
    password { '12345678' }
    address { Faker::Address.full_address }
    phone_number { Faker::Number.number(digits: 12) }
  end

  factory :user_with_payment do
    after(:create) do |user|
      create(:payment, user: user)
    end
  end

  factory :user_with_order do
    after(:create) do |user|
      create(:order, user: user)
    end
  end
end