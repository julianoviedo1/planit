require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:service)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should have_many(:orders) }
    it { should have_many(:service_categories) }
    it { should have_many(:categories) }
    it { should belong_to(:supplier) }
    # it { should have_one_attached(:photo) }
  end
end