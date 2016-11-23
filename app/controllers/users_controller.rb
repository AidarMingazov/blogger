class UsersController < ApplicationController
	def index
    @users = User.where.not(id: current_user.following.map(&:id) << current_user.id).decorate
	end

	def show
		@user = User.find(params[:id]).decorate
    @feed = @user.feed
    
    @user_post = @user.posts

    @who_can_follow_users = User.where.not(id: current_user.following.map(&:id) << current_user.id).decorate
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
