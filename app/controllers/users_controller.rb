class UsersController < ApplicationController
	def index
		@users = User.all.decorate
	end

	def show
		@user = User.find(params[:id]).decorate
	end

  def following
    @user = User.find(params[:id]).decorate
    @following = @user.following.decorate
  end

  def followers
    @user = User.find(params[:id]).decorate
    @followers = @user.followers.decorate
  end
end
