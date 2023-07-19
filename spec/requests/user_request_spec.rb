require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET /index' do
    it 'returns http success for users#show' do
      get '/users/:id', params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for users#index' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the show template success' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'renders the index template success' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder for user show' do
      get '/users/:id'
      expect(response.body).to include('The details of a given user')
    end

    it 'returns the correct placeholder for user index' do
      get '/users'
      expect(response.body).to include('Here are the list of all users')
    end
  end
end
