class Api::V1::UsersController < Api::V1::ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

end
