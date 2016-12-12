class API::V1::RegistrationsController < API::V1::ApplicationController
  skip_before_action :authenticate
end
