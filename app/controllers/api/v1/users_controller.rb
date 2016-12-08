class Api::V1::UsersController < Api::V1::ApplicationController
  ApiController.any_instance.stub(:authenticate)
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
