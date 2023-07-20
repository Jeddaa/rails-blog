class PostsController < ApplicationController
  before_action :index
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
