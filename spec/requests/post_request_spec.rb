require 'rails_helper'

RSpec.describe 'Post', type: :request do
  let(:author) { User.create(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man', posts_counter: 2) }
  let(:post) do
    @post = author.posts.build(title: 'My first rejection',
                               text: 'It was a sad day for me and my friends',
                               comments_counter: 1,
                               likes_counter: 2)
  end
  before { post.save }

  describe 'GET /index' do
    it 'returns http success for posts#index' do
      get user_posts_path(author.id)
      expect(response).to be_successful
    end

    it 'returns http success for posts#show' do
      get "/users/#{author.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(author.id)
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder for posts#index' do
      get user_posts_path(author.id)
      expect(response.body).to include('John Doe')
    end

    it 'renders the correct placeholder for posts#show' do
      get "/users/#{author.id}/posts/#{post.id}"
      expect(response.body).to include('It was a sad day for me and my friends')
    end
  end
end
