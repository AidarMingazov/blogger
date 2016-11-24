class UsersController < ApplicationController
  expose_decorated :user
  expose_decorated :post
  
	def index
    @users = User.where.not(id: current_user.following.map(&:id) << current_user.id)
	end

	def show
    @who_can_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
	end

  def followers
    @who_can_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
  end

  def following
    @who_can_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
  end
end
