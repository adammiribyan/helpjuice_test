require 'rails_helper'

RSpec.describe Search::ArticlesController, type: :controller do
  describe 'GET /index' do
    it 'responds successfully' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'JS request returns the search results' do
      get :index, params: { query: 'how' }, format: :js, xhr: true
      expect(response).to have_http_status(:success)
      expect(assigns(:articles).pluck(:title)).to include('How does Oura measure my heart rate?')
    end

    it 'JS requests creates a Search::Query instance' do
      random_query = Time.now.to_i
      get :index, params: { query: random_query }, format: :js, xhr: true
      expect(Search::Query.where(body: random_query)).to exist
    end
  end
end
