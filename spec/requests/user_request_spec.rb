require 'rails_helper'

RSpec.describe 'User', type: :request do
  let(:user) do
    @user = User.create(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man')
  end

  before { user.save }

  describe 'GET /index' do
    it 'returns http success for users#show' do
      get user_path(user.id)
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for users#index' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the show template success' do
      get user_path(user.id)
      expect(response).to render_template(:show)
    end

    it 'renders the index template success' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder for user show' do
      get user_path(user.id)
      expect(response.body).to include('Bio')
    end

    it 'returns the correct placeholder for user index' do
      get users_path
      expect(response.body).to include('John Doe')
    end
  end
end
