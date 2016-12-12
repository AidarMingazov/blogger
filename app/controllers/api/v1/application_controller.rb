class API::V1::ApplicationController < ActionController::Base
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  respond_to :json

  before_action :authenticate

  protected

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_user = User.find_by(authentication_token: token)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Bad credentials', status: 401
    end
end
