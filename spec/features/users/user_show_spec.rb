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

  describe 'user#show' do
    before(:each) do
      visit user_path(@user1.id)
    end
    it 'should show the username of the user' do
      expect(page).to have_content(@user1.name)
    end
    it 'should show the profile picture for the user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://google.com')]")
    end
    it 'should show the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 4')
    end
    it 'should show the bio of the user' do
      expect(page).to have_content(@user1.bio)
    end
    it 'I can see the user first 3 posts.' do
      expect(page).to_not have_content('Total number of posts: 4')
    end
    it 'should see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content('See all posts')
    end
    it 'should redirect to the post\'s show page when user post is clicked.' do
      visit "/users/#{@user1.id}/posts/#{@post1.id}"
      expect(page).to have_content('My first rejection')
    end
    it 'should redirect to user1\'s show page when user is clicked.' do
      click_link 'See all posts'
      expect(page).to have_current_path('/users')
    end
  end

end
