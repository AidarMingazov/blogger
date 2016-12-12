require 'rails_helper'

RSpec.describe User, :type => :model do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is generate valid nickname with valid attributes' do
    expect(@user).to have_attributes(nickname: "#{ @user.nickname }")
    expect(@user).to_not have_attributes(nickname: nil)
  end


  it 'is generate valid nickname with logn name' do
    user = User.new(email: "another#{@user.email}", first_name: "12345678901",
                    last_name: "#12345678901", password: '123456', password_confirmation: '123456')
    expect(user).to be_valid
  end


  it 'is generate token with valid attributes' do
    expect(@user).to have_attributes(authentication_token: "#{ @user.authentication_token }")
    expect(@user).to_not have_attributes(authentication_token: nil)
  end

  it 'is generate nickname when exist same nickname' do
    user2 = User.new(email: "another#{@user.email}", first_name: "#{@user.first_name}",
                    last_name: "#{@user.last_name}", password: '123456', password_confirmation: '123456')
    expect(user2).to be_valid
    expect(user2).to_not have_attributes(nickname: "#{@user.nickname}")
  end
end
