class API::V1::SessionSerializer < API::V1::BaseSerializer 

attributes :id, :email, :token

def token 
  object.authentication_token
end
