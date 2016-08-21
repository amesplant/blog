class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # we want to create a new post (/posts/new)
  def new
  end

  # save our post
  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  # show our post
  def show
    @post = Post.find(params[:id])
   end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
