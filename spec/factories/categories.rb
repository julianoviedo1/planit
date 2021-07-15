FactoryBot.define do
  factory :category do
    name { 'catering' }
  end

  factory :service_with_categories do
    after(:create) do |service|
      service.categories << FactoryBot.create(:category)
    end
  end
end