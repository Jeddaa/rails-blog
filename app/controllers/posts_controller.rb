class PostsController < ApplicationController
  before_action :index
  def index
    # @posts = Post.where(author_id: params[:user_id])
    # # @user = User.find(id:params[:user_id])ß
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, comments: :author).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id:params[:id])
  end

  # private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def get_comments
  #   @comments = Comment.where(post_id: params[:id])
  # end
end
