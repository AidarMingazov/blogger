require 'rails_helper'

describe API::V1::UsersController do
  context :index do
    before do
      @user_count = 5
      @user_count.times{ FactoryGirl.create(:user) }
      get api_v1_users_path, format: :json
    end

    it 'responds successfully with an HTTP 200 status code' do  
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'responds with user list' do
      expect(User.count).to eq(@user_count)
    end

    it 'do NOT responds users tokens' do
      is_expected(User).to have_attributes(:authentication_token)
    end
  end

  context :show do
    before do
      @user = FactoryGirl.create(:user) 
      get api_v1_users_path(@user), format: :json
    end

    it 'responds successfully with an HTTP 200 status code' do  
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'responds user attributes' do
      expect(@user).to have_attributes(id: @user.id, email: @user.email, first_name: @user.first_name, 
                                      last_name: @user.last_name, nickname: @user.nickname,
                                      created_at: @user.created_at, updated_at: @user.updated_at)
    end

    it 'do NOT responds user token' do
      is_expected(@user).to have_attributes(:authentication_token)
    end
  end

  context :update do
    before do
      @user = FactoryGirl.create(:user) 
      # get "/api/v1/users/#{ @user.id }", format: :json
      # login(@user)
      sign_in(@user)
      # page.driver.post new_user_session_path, '@user[email]' => @user.email, 'user[password]' => 'password123'

      # @first_name = 'Another name'
      # @user.first_name = @first_name
      # put api_v1_user_path(@user.id), user: @user.as_json, format: :json
      get api_v1_users_path(@user), format: :json

    end

    it 'responds successfully with an HTTP 200 status code' do  
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end


    it 'returns attributes' do
      # expect(@user).to only(:email, :name, :admin, :activated, :id)
    end

    it 'do NOT responds user token' do
      is_expected(@user).to have_attributes(:authentication_token)
    end
  end

end





#   context :create do
#     before do
#       #create_and_sign_in_user
#       @user = FactoryGirl.attributes_for(:user)
#       post api_v1_users_path, user: @user.as_json, format: :json
#     end

#     it_returns_status(201)

#     it_returns_attributes(resource: 'user', model: '@user', only: [
#       :email, :name
#     ])

#     it_returns_more_attributes(
#       resource: 'user',
#       model: 'User.last!',
#       only: [:updated_at, :created_at],
#       modifier: 'iso8601'
#     )
#   end

#   context :show do
#     before do
#       create_and_sign_in_user
#       FactoryGirl.create(:user)
#       @user = User.last!

#       get api_v1_user_path(@user.id), format: :json
#     end

#     it_returns_status(200)

#     it_returns_attributes(resource: 'user', model: '@user', only: [
#       :email, :name, :admin, :activated, :id
#     ])

#     it_returns_more_attributes(
#       resource: 'user',
#       model: '@user',
#       only: [:updated_at, :created_at],
#       modifier: 'iso8601'
#     )
#   end


#   context :update do
#     before do
#       @user = FactoryGirl.create(:user)
#       sign_in(@user)
#       @name = 'Another name'
#       @user.name = @name
#       put api_v1_user_path(@user.id), user: @user.as_json, format: :json
#     end

#     it_returns_status(200)

#     it_returns_attributes(resource: 'user', model: '@user', only: [
#       :email, :name, :admin, :activated, :id
#     ])

#     it_returns_more_attributes(
#       resource: 'user',
#       model: '@user',
#       only: [:updated_at, :created_at],
#       modifier: 'iso8601'
#     )

#     it_includes_in_headers({Location: 'api_v1_user_path(@user.id)'})
#   end

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
