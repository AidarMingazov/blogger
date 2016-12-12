class API::V1::PostsController < API::V1::ApplicationController
  # skip_before_action :authenticate, only: [:index, :show]
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: Post.all
  end

  def show
    render json: @post, status: 200
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    @post.save
  end

  def destroy
    @post.destroy
  end

  def upvote
    @post = Post.select('id, upvotes').find params[:id]
    @post.increment!(:upvotes) if @post
  end

  def downvote
    @post = Post.select('id, downvotes').find params[:id]
    @post.increment!(:downvotes) if @post
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
