FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.unique.name }
    email { "#{last_name.delete(' ')}@email.com" }
    password { '12345678' }
    address { Faker::Address.full_address }
    phone_number { Faker::Number.number(digits: 12) }

    # after(:build) do |user|
    #   user.credit_cards << create(:credit_card, user: user)
    # end
  end
end