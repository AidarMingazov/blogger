class API::V1::PostSerializer < API::V1::BaseSerializer
  attributes :title, :body, :user, :created_at, :updated_at
end
