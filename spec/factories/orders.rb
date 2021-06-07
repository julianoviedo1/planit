FactoryBot.define do
  factory :order do
    user
    payment
    service
    quantity { 10 }
    delivery_date { Date.today + 5.days }
    start_time { '5A' }
    end_time { Date.today.strftime('%Y-%m-%d') }
    status { 'pending' }
    home_delivery { true }
    address { Faker::Address.full_address }
  end
end
