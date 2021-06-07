require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /' do
    context 'when user not logged in' do
      it 'has a 200 status code' do
        get '/'
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET categories#show' do
    let!(:category_visible) { create(:category) }
    let(:supplier) { create(:supplier) }
    let!(:service) { create(:service, supplier: supplier, name: 'Pizzas and Love') }

    before(:each) do
      create(:category, name: 'Catering')
    end

    context 'when user not logged in' do
      it 'has a 200 status code' do
        get category_path(category_visible)
        expect(response.status).to eq(200)
      end
    end
  end
end
