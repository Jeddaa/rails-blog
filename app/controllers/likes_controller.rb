class LikesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.post_id = params[:post_id]
    @like.author_id = current_user.id

    if @like.save
      redirect_to users_path, notice: 'Like was successfully created.'
    else
      render 'posts#show'
    end
  end

  private

  def set_current_user
    @current_user = current_user
  end

  def like_params
    params.permit(:text)
  end
end
