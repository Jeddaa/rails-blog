class CommentsController < ApplicationController
  before_action :set_current_user, only: %i[new create]
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

  private

  def set_current_user
    @current_user = current_user
  end

  def comment_params
    params.permit(:text)
  end
end
