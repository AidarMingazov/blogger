class API::V1::UserSerializer < API::V1::ApplicationSerializer
  attributes :id, :email, :first_name, :last_name, :nickname, :created_at

  # has_many :posts
  # has_many :following
  # has_many :followers
end
