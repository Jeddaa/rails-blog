class UpdateExistingUsersPhotoLink < ActiveRecord::Migration[7.0]
  def change
    # Update the 'photo' column for existing users
    User.where(photo: nil).update_all(photo: 'https://user2photo.com')
  end
end
