describe "User API" do
  it 'retrieves a specific user' do
    user = FactoryGirl.create(:user)
    get "/api/v1/users/#{user.id}"

    # test for the 200 status-code
    expect(response).to be_success
  end
end
