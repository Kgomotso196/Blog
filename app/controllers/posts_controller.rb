class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_user, only: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @user_posts = @user.posts
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
