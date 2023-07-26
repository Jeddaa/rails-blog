class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to users_path, notice: 'Comment was successfully created.'
    else
      render 'posts#show'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to user_post_path(@post), notice: 'Comment was successfully deleted.'
  end

  private

  def set_current_user
    @current_user = current_user
  end

  def comment_params
    params.permit(:text)
  end
end
