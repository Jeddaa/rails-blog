class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @user = User.find(params[:user_id])
    # @user =current_user
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    #no need to initialise user for now as user_id will be passed in the body to ensure
    # that the user making the request is the author bcos no login yet so it can't pick up the id from the params.

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: @comment.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id)
  end
end
