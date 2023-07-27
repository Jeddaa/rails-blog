class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  # load_and_authorize_resource
  # before_action :set_current_user


  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, comments: :author)
  end

  def show
    @post = Post.find_by(id: params[:id])
    # @user = current_user
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    # this is for when we had the current_user method in the application controller
    # or when the confirmable has been correctly setup so the current_user will have a value
    # @user = current_user

    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_posts_path(@post.author_id), notice: 'Post was successfully deleted.'
    else
      flash.now[:errors] = @post.errors.full_messages
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  # def set_current_user
  #   @current_user = current_user
  # end
end
