class API::V1::SessionSerializer < API::V1::ApplicationSerializer 

attributes :id, :email, :token

def token 
  object.authentication_token
end
