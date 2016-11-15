class UsersController < ApplicationController
	def index
		@users = User.all.decorate
	end

	def show
		@user = User.find(params[:id]).decorate
	end

end
