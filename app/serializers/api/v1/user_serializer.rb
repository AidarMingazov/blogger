class API::V1::UserSerializer < API::V1::BaseSerializer
  attributes :id, :email, :first_name, :last_name, :created_at, :updated_at

  has_many :posts
  has_many :following
  has_many :followers
end
