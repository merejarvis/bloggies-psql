class PostsController < ApplicationController
  before_action :authenticate_user!
# before_action :authenticate_user!, only: [:new, :edit]
#use except
  def index

    news_url = 'https://newsapi.org/v1/articles?source=engadget&sortBy=top&apiKey=1eff6268512d43ff87125794dccec730'

    response = HTTParty.get(news_url)

    # render json: response

    @news = response

    # render json: current_user.posts

    @all_posts = current_user.posts
    @new_post = current_user.posts.new

    # render json: current_user.name
  end

  def show
    @post = Post.find(params[:id])
    # render html: 'show one post'
  end

  def new
    render html: 'new posts'
  end

  def edit
      @update_post= Post.find(params[:id])
    # render json: @update_post
  end

  def update
    # updated_post= Post.find(params[:id])
    # updated_post.title = params[:post][:title]
    # updated_post.content = params[:post][:content]
    # updated_post.save

# or
    Post.find(params[:id]).update(post_params)

    redirect_to posts_path
  end

  def create
    # creating_post = params.require(:post).permit(:title, :content, :user_id)


    # or
    # creating_post = current_user.post.build
    # creating_post.title = params[:post][:title]


    # render json: @creating_post

    Post.create(post_params)

    redirect_to posts_path
  end

  def destroy
    Post.destroy(params[:id])
    # OR
    # deleted_post = Post.find(params[:id])
    # deletd_post.destroy

    redirect_to posts_path
  end

private

def post_params

  params.require(:post).permit(:title, :content, :user_id)

end

end
