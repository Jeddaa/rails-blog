require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John Doe', photo: 'https://google.com', bio: 'I am a man', posts_counter: 0)
    @post1 = Post.create(title: 'My first rejection',
                         text: 'It was a sad day for me and my friends',
                         comments_counter: 1,
                         author: @user1, likes_counter: 2)
    @post2 = Post.create(title: 'post 2 title',
                         text: 'post text 2',
                         comments_counter: 0,
                         likes_counter: 0,
                         author: @user1)
    @post3 = Post.create(title: 'post 3 title',
                         text: 'post text 3',
                         comments_counter: 1,
                         likes_counter: 1,
                         author: @user1)
    @post4 = Post.create(title: 'post 4 title',
                         text: 'post text 4',
                         comments_counter: 3,
                         likes_counter: 3,
                         author: @user1)
  end


end
