class API::V1::UsersController < API::V1::ApplicationController
  # skip_before_action :authenticate, only: [:show]

  before_action :set_user

  def index
  end
  
  def show
    render json: @user, status: 200
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
