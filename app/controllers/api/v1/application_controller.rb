class API::V1::ApplicationController < ActionController::Base
  before_action :authenticate
  respond_to :json

  protected

    def authenticate
      set_current_user || render_unauthorized
    end

    def set_current_user
      @current_user = authenticate_token
    end

    def authenticate_token
      User.find_by(authentication_token: request.headers["X-Token"])
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Bad credentials', status: 401
    end
end
