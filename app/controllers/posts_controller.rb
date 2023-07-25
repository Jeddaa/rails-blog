class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_current_user
    @current_user = current_user
  end
end
