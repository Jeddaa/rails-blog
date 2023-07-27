class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts
  end
end
