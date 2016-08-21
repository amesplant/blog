class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # we want to create a new post (/posts/new)
  def new
    @post = Post.new
  end

  # save our post
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
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
