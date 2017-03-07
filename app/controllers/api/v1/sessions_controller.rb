class API::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  respond_to :json

  def create
    @user = User.find_by(email: params[:email])
    if @user.valid_password?(params[:password])
      respond_with @user
    else
      render nothing: true, status: 422
    end
  end
end
