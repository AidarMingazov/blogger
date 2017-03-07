class API::V1::UsersController < API::V1::ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
  end
  
  def show
    render json: @user, status: 200
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user, status: 202
    else
      render json: @user, status: 400
    end
  end

  def destroy
    unless @user.nil?
      @user.destroy
      render nothing: true, status: 410
    else
      render nothing: true, status: 404
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname)
    end
end
