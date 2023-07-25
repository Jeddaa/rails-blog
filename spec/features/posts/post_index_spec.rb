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

  describe 'post#index' do
    before(:each) do
      visit user_posts_path(@user1.id)
    end

    it 'should show the username of the user' do
      expect(page).to have_content(@user1.name)
    end

    it 'should show the profile picture for the user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://google.com')]")
    end

    it 'should show the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 2')
    end

    it 'should show a post title' do
      expect(page).to have_content(@post1.title)
    end

    it 'should show a some of the post body' do
      expect(page).to have_content(@post1.text)
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('First to comment')
    end

    it 'should see how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
      expect(page).to_not have_content('Comments: 10')
    end

    it 'should see how many likes a post has.' do
      expect(page).to have_content('Likes: 2')
      expect(page).to_not have_content('Likes: 20')
    end

    it 'should show a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end

    it 'should redirect to the post\'s show page when user post is clicked.' do
      visit "/users/#{@user1.id}/posts/#{@post1.id}"
      expect(page).to have_content('My first rejection')
    end
  end
end
