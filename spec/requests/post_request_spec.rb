require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET /index' do
    it 'returns http success for posts#index' do
      get '/users/:user_id/posts'
      expect(response).to be_successful
    end

    it 'returns http success for posts#show' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'renders the show template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder for posts#index' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Here are the list of all posts for a given user')
    end

    it 'renders the correct placeholder for posts#show' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('The details of a particular post for a given user')
    end
  end
end
