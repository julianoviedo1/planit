require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:supplier)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_inclusion_of(:opens_at).in_range(0..23) }
    it { should validate_inclusion_of(:close_at).in_range(0..23) }
    it { should validate_presence_of(:phone_number) }
    it {
      should validate_length_of(:phone_number)
        .is_at_least(8).is_at_most(12)
    }
  end

  describe 'associations' do
    it { should have_many(:services) }
    # it { should have_one_attached(:photo) }
  end
end
