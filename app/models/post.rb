class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter
  def update_post_counter
    postr = User.find_by_id(author.id)
    postr.posts_counter = poster.posts_counter.to_i + 1
    postr.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
