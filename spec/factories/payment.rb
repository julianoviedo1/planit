FactoryBot.define do
  factory :payment do
    user
    payment_type { 'debit_card' }
    card_number { Faker::Number.number(digits: 12) }
    secure_number { Faker::Number.number(digits: 3) }
    current_method { true }
  end
end