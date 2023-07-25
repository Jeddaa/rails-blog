require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John Doe', photo: 'https://google.com', bio: 'I am a man', posts_counter: 0)
    @post1 = Post.create(title: 'My first rejection',
                         text: 'It was a sad day for me and my friends',
                         comments_counter: 1,
                         author: @user1, likes_counter: 2)
    @post2 = Post.create(title: 'post 2 title',
                         text: 'post text 2',
                         comments_counter: 1,
                         likes_counter: 0,
                         author: @user1)
    @comment1 = Comment.create(text: 'First to comment',
                               author_id: @user1.id,
                               post_id: @post1.id)
  end

  describe 'user#index' do
    before(:each) do
      visit user_post_path(@user1.id, @post1.id)
    end

    it 'should show the post title' do
      expect(page).to have_content(@post1.title)
    end

    it 'should show the post author' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content('John Doe')
      expect(page).to have_content('My first rejection by John Doe')
    end

    it 'should show a some of the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('First to comment')
    end

    it 'should see how many comments the post has.' do
      expect(page).to have_content('Comments: 2')
      expect(page).to_not have_content('Comments: 10')
    end

    it 'should see how many likes a post has.' do
      expect(page).to have_content('Likes: 2')
      expect(page).to_not have_content('Likes: 20')
    end

    it 'should show the username of the commenter' do
      expect(page).to have_content(@comment1.author.name)
    end

    it 'should show the comment each commentor left' do
      expect(page).to have_content(@comment1.text)
    end
  end
end
