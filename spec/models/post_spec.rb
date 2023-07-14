require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man', posts_counter: 2) }
  let(:post) do
    author.posts.build(title: 'My first rejection', text: 'It was a sad day for me and my friends', comments_counter: 1,
                       likes_counter: 2)
  end

  before { post.save }

  it 'title should not be null' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title should not be over 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'title should be valid' do
    expect(post).to be_valid
  end

  it 'title should be valid' do
    post.title = 'a' * 250
    expect(post).to be_valid
  end

  it 'comments_counter should not be null' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'comments_counter should not be a string' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'comments_counter should not be negative' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'comments_counter should be valid' do
    expect(post).to be_valid
  end
end
