class PostsController < ApplicationController
  before_action :index
  def index
    # @posts = Post.where(author_id: params[:user_id])
    # # @user = User.find(id:params[:user_id])ß
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, comments: :author).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
