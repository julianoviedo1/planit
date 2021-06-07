require 'rails_helper'

RSpec.describe 'Suppliers', type: :request do
  let!(:user) { create(:user) }
  let(:supplier) { create(:supplier) }

  before(:each) do
    create(:supplier)
    login_as user
  end

  describe 'GET /supplier/:id' do
    context 'when user not logged in' do
      it 'redirects to sign in page' do
        get supplier_path(supplier)

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is logged in' do
      it 'is able to see the show page' do
        sign_in(user, scope: :user)
        get supplier_path(supplier)

        expect(response).to have_http_status(:success)
      end
    end
  end
end
