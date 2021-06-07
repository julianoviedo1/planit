require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:user) { create(:user) }

  before(:each) do
    create(:supplier)
    login_as user
  end

  describe 'GET /orders' do
    context 'when user not logged in' do
      it 'redirects to sign in page' do
        get orders_path

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is logged in' do
      it 'is able to see the index page' do
        sign_in(user, scope: :user)
        get orders_path

        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is logged in' do
      it 'is able to see the index page' do
        sign_in(user, scope: :user)
        get orders_path

        expect(response).to have_http_status(:success)
      end
    end
  end
end
