class RelationshipsController < ApplicationController
  before_action :user_signed_in?

  def create
    @user = User.find(params[:user_id])
    if @user != current_user
      current_user.follow(@user)
      respond_to do |format|
        format.js { redirect_to @user }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.js { redirect_to @user }
    end
  end
end

