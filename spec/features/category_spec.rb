require 'rails_helper'

RSpec.feature 'Categories', type: :feature, js: true do
  describe 'index of categories' do
    subject { page }

    let(:user) { create(:user) }
    let(:supplier) { create(:supplier, name: 'Pizzas and Love') }
    let!(:category_visible) { create(:category) }

    before(:each) do
      create(:category, name: 'Catering')
      login_as(user, scope: :user)
      byebug
      visit "categories/#{category_visible.id}"
    end

    it 'category search' do
      fill_in :search, with: 'Pizzas'
      click_button('search')
      expect(page).to have_content(service.name)
    end
  end
end
