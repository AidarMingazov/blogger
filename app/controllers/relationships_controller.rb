class RelationshipsController < ApplicationController
  before_action :user_signed_in?
  expose_decorated :user

  def create
    if user != current_user
      current_user.follow(user)
      respond_to do |format|
        format.js { redirect_to user }
      end
    end
  end

  def destroy
    current_user.unfollow(user)
    respond_to do |format|
      format.js { redirect_to user }
    end
  end
end

