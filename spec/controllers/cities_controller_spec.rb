require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  context 'GET #query' do
    before do
      test_params = {
        state_id: 1,
        query: 'at'
      }

      get :query, params: test_params, format: :json
    end

    it 'succeeds' do
      expect(response).to have_http_status(200)
    end

    it 'matches Pato Branco' do
      expect(response.body).to match(/Pato Branco/)
    end
  end
end