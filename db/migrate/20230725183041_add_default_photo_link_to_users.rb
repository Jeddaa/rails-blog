class AddDefaultPhotoLinkToUsers < ActiveRecord::Migration[7.0]
  def change
     change_column_default :users, :photo, 'https://user2photo.com'
  end
end
