class API::V1::SessionsController < API::V1::ApplicationController
  
  def create
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])
      self.current_user = user
      render(
        json: API::V1::SessionSerializer.new(user, root: false).to_json,
        status: 201
      )
    else
      return api_error(status: 401)
    end
  end

  private
    def create_params
      params.require(:user).permit(:email, :password)
    end
end
