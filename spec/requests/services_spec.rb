require 'rails_helper'

RSpec.describe "Services", type: :request do
  let!(:user) { create(:user) }
  let!(:service) { create(:service) }

  before(:each) do
    create(:service)
  end

  describe 'GET services/:id' do
    context 'when user not logged in' do
      it 'redirects to sign in page' do
        get service_path(service)

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is logged in' do
      it 'is able to see the show page' do
        sign_in(user, scope: :user)
        get service_path(service)

        expect(response).to have_http_status(:success)
      end
    end
  end

  # describe 'GET services/new' do
  #   context 'when user is not an admin' do
  #     it 'shows an error message' do
  #       login_as(user, scope: :user)
  #       get new_provider_service_path(Provider.last)

  #       expect(response.body).to include('No tenés permitido crear nuevos servicios!')
  #     end
  #   end

  #   context 'when user is an admin' do
  #     it 'can create new services' do
  #       login_as(create(:user, admin: true), scope: :user)
  #       get new_admin_service()

  #       expect(response.body).to include('Crear nuevo servicio')
  #     end
  #   end
  # end

  # describe 'POST /services' do
  #   context 'when user is admin and gives valid information' do
  #     it 'creates a new service for the provider' do
  #       login_as(create(:user, admin: true), scope: :user)
  #       get new_provider_service_path(Provider.last)
  #       service_params = {
  #         service: {
  #           name: Service.last.name,
  #           description: Service.last.description,
  #           cost: Service.last.cost,
  #           provider_id: Provider.last.id
  #         }
  #       }
  #       post provider_services_path, params: service_params
  #       expect(response).to redirect_to provider_service_path(Provider.last, Service.last)
  #     end
  #   end
  # end
end
