class API::V1::PostsController < API::V1::ApplicationController
  skip_before_action :authenticate, only: [:show]
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: Post.all
  end

  def show
    render json: @post, status: 200
  end

  def create
    @post = @current_user.posts.create(post_params)
    @post.save
  end

  def update
    if @post.assign_attributes(post_params)
      render json: @post, status: 200
      @post.update
    end
  end

  def destroy
    @post.destroy
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
