require 'rails_helper'

RSpec.describe ServiceCategory, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:service_category)).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:service) }
    it { should belong_to(:category) }
  end
end
