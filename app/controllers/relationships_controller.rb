class RelationshipsController < ApplicationController
	before_action :user_signed_in?

  def create
    user = User.find(params[:followed_id])
    
    if user != current_user
    	current_user.follow(user)
	    respond_to do |format|
        # bug
        format.html { redirect_to @user }
        format.js
      end
	  end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      # bug
      format.html { redirect_to @user }
      format.js
    end
  end
end
