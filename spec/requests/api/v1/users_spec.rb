require 'rails_helper'
describe 'User API' do
  it 'return user' do
    user = FactoryGirl.create(:user)
    get "/api/v1/users/#{user.id}"
    expect(response).to be_success
  end
end
