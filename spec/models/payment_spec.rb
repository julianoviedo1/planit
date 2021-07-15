require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:payment)).to be_valid
  end

  describe 'validations' do
    it {
      should define_enum_for(:payment_type)
        .with_values(cash: 0, credit_card: 1, debit_card: 2, wire: 3, bank_check: 4)
    }
    it { should validate_length_of(:card_number).is_equal_to(16) }
    it { should validate_length_of(:secure_number).is_equal_to(3) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:orders) }
  end
end