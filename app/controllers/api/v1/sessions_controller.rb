class API::V1::SessionsController < API::V1::ApplicationController
  skip_before_action :authenticate


end
