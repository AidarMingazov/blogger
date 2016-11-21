class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    		user_params.permit(:email, :password, :password_confirmation,
    												:first_name, :last_name, :nickname)
  		end

	    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :email, :password, :current_password])
    end
end
