class API::V1::PostSerializer < API::V1::ApplicationSerializer
  attributes :title, :body, :user_id, :created_at
end
