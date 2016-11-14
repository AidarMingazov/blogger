class RelationshipsController < ApplicationController
	before_action :user_signed_in?

  def create
    user = User.find(params[:followed_id])
    if user != current_user
    	current_user.follow(user)
    end
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
