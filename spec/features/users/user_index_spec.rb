require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let(:user) do
    @user1 = User.create(name: 'John Doe', photo: 'https://google.com', bio: 'I am a man', posts_counter: 0)
    @user2 = User.create(name: 'Mary Hopkins', photo: 'https://user2photo.com', bio: 'I am a woman', posts_counter: 1)
  end

  before { user.save }

  describe 'user#index' do
    before(:each) do
      # visit "/users"
      visit users_path
    end

    it 'should show the username of all other users' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://google.com')]")
      expect(page).to have_xpath("//img[contains(@src,'https://user2photo.com')]")
    end

    it 'should show the number of posts each user has written.' do
      expect(page).to have_content(@user1.posts_counter)
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content(@user2.posts_counter)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'should redirect to user1\'s show page when user is clicked.' do
      click_link 'John Doe'
      expect(page).to have_current_path("/users/#{@user1.id}")
    end

    it 'should redirect to that user2\'s show page when user is clicked.' do
      click_link 'Mary Hopkins'
      expect(page).to have_current_path("/users/#{@user2.id}")
    end
  end
end
