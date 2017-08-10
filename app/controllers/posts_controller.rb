class PostsController < ApplicationController
  before_action :authenticate_user!
# before_action :authenticate_user!, only: [:new, :edit]
#use except
  def index
    # render json: current_user.posts
    @all_posts = current_user.posts
    # render json: current_user.name
  end

  def show
    render html: 'show one post'
  end

  def new
    render html: 'new posts'
  end

  def edit
    render html: 'edit posts'
  end



end
