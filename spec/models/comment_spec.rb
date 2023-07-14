require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { User.create(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man', posts_counter: 2) }

  let!(:post) do
    Post.create(author: user, title: 'My first post', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
  end

  let(:comment) { Comment.new(author: user, post:, text: 'Great post!') }

  before { comment.save }

  it 'text should not be an integer' do
    comment.text = 1234
    expect(comment).to_not be_an(Integer)
  end

  it 'text should be valid' do
    expect(comment).to be_valid
  end

  it 'text should be valid' do
    expect(comment.text).to_not eq('I am a comment')
  end

  it 'text should be a string' do
    expect(comment.text).to be_a(String)
  end

  it 'text should be present' do
    expect(comment.text).to be_present
  end

  it 'comment_author should not be null ' do
    comment.author = nil
    expect(comment).to_not be_valid
  end

  it 'comment author_id should not be a string ' do
    comment.author_id = 'a'
    expect(comment.author_id).to_not be_a(String)
  end
end
