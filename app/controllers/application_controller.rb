class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  expose_decorated :user

  def who_to_follow
    unless current_user.nil?
      @who_can_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation,
                            :first_name, :last_name)
      end

      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:first_name, :last_name, :nickname, :email, 
                          :password, :current_password, :password_confirmation, :avatar)
      end
    end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
