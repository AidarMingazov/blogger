class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_who_to_follow, only: [:index, :show, :followers, :following, :who_to_follow]
  expose_decorated :user
  expose_decorated :post
  
  def update
    if user.update(user_params)
      redirect_to user
    else
      render :edit, alert: "Could not update, Please try again"
    end
  end

  private
  
    def set_who_to_follow
      @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :avatar)
    end
end
