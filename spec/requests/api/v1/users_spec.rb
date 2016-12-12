require 'rails_helper'

describe API::V1::UsersController do

  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  # context :index do
  #   before do
  #     @user = FactoryGirl.create(:user) 
  #     @user_count = 5
  #     @user_count.times{ FactoryGirl.create(:user) }
  #     get api_v1_users_path, {}, { Authorization: token_header(@user.authentication_token)}
  #   end

  #   it 'responds successfully with an HTTP 200 status code' do  
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it 'responds with user list' do
  #     expect(User.count).to eq(@user_count)
  #   end
  # end

  context :show do
    before do
      @user = FactoryGirl.create(:user) 
    end

    it 'valid authentication with token' do
      get api_v1_user_path(@user), {}, { Authorization: token_header(@user.authentication_token)}
      expect(response).to have_http_status(200)
    end

    it 'invalid authentication with token' do
      get api_v1_user_path(@user), {}, { Authorization: token_header("fake")}
      expect(response).to have_http_status(401)
    end

    it 'responds user attributes' do
      expect(@user).to have_attributes(id: @user.id, email: @user.email, first_name: @user.first_name, 
                                      last_name: @user.last_name, nickname: @user.nickname,
                                      created_at: @user.created_at, updated_at: @user.updated_at)
    end
  end

  context :update do
    before do
      @user = FactoryGirl.create(:user) 
      @first_name = "anothe_name"
      @user.first_name = @first_name
      put "/api/v1/users/#{@user.id}", {}, { Authorization: token_header(@user.authentication_token)},
           user: @user.as_json, format: :json    
    end

    it 'responds successfully with an HTTP 200 status code' do  
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'is successful update' do
      expect(@user).to have_attributes(first_name: "#{ @first_name }")
    end
  end
end

  # context :create do
  #   before do
  #     #create_and_sign_in_user
  #     @user = FactoryGirl.attributes_for(:user)
  #     post api_v1_users_path, user: @user.as_json, format: :json
  #   end

  #   it_returns_status(201)

  #   it_returns_attributes(resource: 'user', model: '@user', only: [
  #     :email, :name
  #   ])

  #   it_returns_more_attributes(
  #     resource: 'user',
  #     model: 'User.last!',
  #     only: [:updated_at, :created_at],
  #     modifier: 'iso8601'
  #   )
  # end


#   context :delete do
#     context 'when the resource does NOT exist' do
#       before do
#         @user = create_and_sign_in_user

#         delete api_v1_user_path(rand(100..1000)), format: :json
#       end

#       it_returns_status(404)
#     end

#     context 'when the resource does exist' do
#       before do
#         @user = create_and_sign_in_user

#         delete api_v1_user_path(@user.id), format: :json
#       end

#       it_returns_status(204)

#       it 'actually deletes the resource' do
#         expect(User.find_by(id: @user.id)).to eql(nil)
#       end
#     end
#   end
# end
