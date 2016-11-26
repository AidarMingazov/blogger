class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated :user
  expose_decorated :post
  
	def index
    @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
	end

	def show
    @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
	end

  def followers
    @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
  end

  def following
    @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
  end

  def who_to_follow
    @who_to_follow = User.where.not(id: current_user.following.map(&:id) << current_user.id)
  end
end
