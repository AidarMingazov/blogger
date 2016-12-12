class API::V1::UsersController < API::V1::ApplicationController
  skip_before_action :authenticate, only: [:show]
  
end
