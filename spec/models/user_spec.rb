require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it {
      should validate_length_of(:phone_number)
        .is_at_least(8).is_at_most(12)
    }
  end

  describe 'associations' do
    it { should have_many(:payments) }
    it { should have_many(:orders) }
  end
end