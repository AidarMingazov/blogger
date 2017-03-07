require 'rails_helper'

describe API::V1::UsersController do

  context :show do
    before do
      @user = create(:user) 
    end

    it 'valid authentication with token' do
      @user_params = {}.to_json
      @request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "X-Token" => @user.authentication_token
      }

      get api_v1_user_path(@user), @user_params, @request_headers

      expect(response).to have_http_status(200)
    end

    it 'invalid authentication with token' do
      # вывести в метод
      @request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "X-Token" => "fake_token"
      }
      get api_v1_user_path(@user), @user_params, @request_headers
      expect(response).to have_http_status(401)
    end

    it 'responds user attributes' do
      # user.attributes
      expect(@user).to have_attributes(id: @user.id, email: @user.email, first_name: @user.first_name, 
                                      last_name: @user.last_name, nickname: @user.nickname,
                                      created_at: @user.created_at, updated_at: @user.updated_at)
    end
  end

  context :update do
    before do
      let(:user) { create(:user) }
      @first_name = "anothe_name"
      @user.first_name = @first_name
      
      @request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "X-Token" => @user.authentication_token
      }

      @user_params = {
        'user' => {
          'first_name' => 'new_name',
          'last_name' => 'last_name'
        }
      }.to_json

      put "/api/v1/users/#{@user.id}", @user_params, @request_headers  
    end

    it 'responds successfully with an HTTP 202 status code' do  
      expect(response).to be_success
      expect(response).to have_http_status(202)
    end

    it 'is successful update' do
      # fix
      expect(@user).to have_attributes(first_name: "#{ @user: first_name }")
    end
  end

  context :destroy do
    before do
      @user = create(:user)
      @user_params = {}.to_json
      @request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "X-Token" => @user.authentication_token
      }
    end

    it 'when the resource does NOT exist' do
      delete api_v1_user_path(rand(100..1000)), @user_params, @request_headers
      expect(response).to be_success
      expect(response).to have_http_status(404)
    end

    it 'actually deletes the resource' do
      delete api_v1_user_path(@user), @user_params, @request_headers
      expect(User.find_by(id: @user.id)).to eql(nil)
    end
  end
end
