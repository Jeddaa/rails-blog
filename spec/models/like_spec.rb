require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { User.create(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man', posts_counter: 2) }
  let(:post) do
    user.posts.build(title: 'My first rejection', text: 'It was a sad day for me and my friends', comments_counter: 1,
                     likes_counter: 2)
  end
  let(:like) { post.likes.build(author: user, post:) }

  before { like.save }

  it 'like should be valid ' do
    expect(like).to be_valid
  end

  it 'like should not be valid ' do
    like.author = nil
    expect(like).to_not be_valid
  end

  it 'like should not be valid ' do
    like.author_id = 'a'
    expect(like).to_not be_valid
  end

  it 'like should not be valid ' do
    like.post = nil
    expect(like).to_not be_valid
  end

  it 'like should not be valid ' do
    like.post_id = 'a'
    expect(like).to_not be_valid
  end
end
