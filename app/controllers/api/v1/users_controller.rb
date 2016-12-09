class API::V1::UsersController < API::V1::ApplicationController

  def index
    users = User.all
    render json: users, status: 200

    # ActiveModel::Serializer::CollectionSerializer.new(users, each_serializer: API::V1::UserSerializer)
    # render json: ActiveModel::Serializer::CollectionSerializer.new(User.all, each_serializer: API::V1::UserSerializer),status: 200
    
    # render( json: ActiveModel::CollectionSerializer.new(users, each_serializer: API::V1::UserSerializer) )

    # render(
    #   json: ActiveModel::ArraySerializer.new(
    #     users,
    #     each_serializer: API::V1::UserSerializer,
    #     root: 'users',
    #     meta: meta_attributes(users)
    #   )
    # )
  end

  def show
    user = User.find(params[:id])
    render json: user, each_serializer: API::V1::UserSerializer
  end
end
