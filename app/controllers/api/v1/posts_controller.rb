class API::V1::PostsController < API::V1::ApplicationController

  def index
    posts = Post.all
  end

  def show
    post = Post.find(params[:id])
    render json: post, each_serializer: API::V1::PostSerializer
  end
end
