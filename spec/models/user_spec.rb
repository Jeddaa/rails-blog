require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'John Doe', photo: 'www.google.com', bio: 'I am a man', posts_counter: 2) }
  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'name should be present' do
    expect(user).to be_valid
  end

  it 'posts_counter should be an integer' do
    user.posts_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'bio should be present' do
    expect(user).to be_valid
  end

  it 'photo should be present' do
    expect(user).to be_valid
  end

  it 'post_counter should be valid' do
    expect(user).to be_valid
  end

  it 'posts_counter should not be valid' do
    user.posts_counter = -2
    expect(user).to_not be_valid
  end

  it 'user posts_counter should not be a string ' do
    user.posts_counter = 'a'
    expect(user.posts_counter).to_not be_a(String)
  end

  it 'user posts_counter should not be a string ' do
    user.posts_counter = 2
    expect(user.posts_counter).to be_an(Integer)
  end
end
