require 'rails_helper'

RSpec.feature 'Users', type: :feature, js: true do
  let!(:user) { create(:user) }

  before(:each) do
    create(:supplier)
    login_as(user, scope: :user)
    visit '/'
  end

  describe 'Edit user information' do
    before(:each) do
      click_on 'dropdown-menu-primary'
      click_on 'Settings'
    end

    context 'when giving valid data' do
      it 'the user can edit his personal information' do
        fill_in 'Dirección', with: 'Hidalgo 123, CABA, buenos aires'
        click_on 'submit'

        expect(page).to have_current_path('/')
      end
    end

    context 'when leaving empty name' do
      it 'shows an error message' do
        fill_in 'user_first_name', with: ''
        click_on 'submit'

        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
