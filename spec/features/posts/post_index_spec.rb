require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John Doe', photo: 'https://google.com', bio: 'I am a man', posts_counter: 0)
    @post1 = Post.create(title: 'My first rejection',
                         text: 'It was a sad day for me and my friends',
                         comments_counter: 1,
                         likes_counter: 2,
                         author: @user1)
    @post2 = Post.create(title: 'post 2 title',
                         text: 'post text 2',
                         comments_counter: 1,
                         likes_counter: 0,
                         author: @user1)
    @comment1 = Comment.create(text: 'First to comment',
                               author_id: @user1.id,
                               post_id: @post1.id)
  end


end
