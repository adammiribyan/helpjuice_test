require 'rails_helper'

RSpec.describe 'Search::Analytics', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/search/analytics'
      expect(response).to have_http_status(:success)
    end
  end
end
