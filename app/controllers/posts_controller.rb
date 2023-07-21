class PostsController < ApplicationController
  before_action :set_current_user, only: %i[new create]

  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  # @post.author_id = current_user.id

  def create
    @post = @current_user.posts.build(post_params)
    # @post = @current_user.posts.build(post_params)

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
    # @user = current_user
  end
end
