require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:address).on(:update) }
    it { should validate_presence_of(:status) }
    it {
      should define_enum_for(:status)
        .with_values(pending: 0, confirmed: 1, completed: 2, cancelled: 3)
    }
    it { should validate_inclusion_of(:start_time).in_range(0..23).on(:update) }
    it { should validate_inclusion_of(:end_time).in_range(0..23).on(:update) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:payment) }
    it { should belong_to(:service) }
  end
end