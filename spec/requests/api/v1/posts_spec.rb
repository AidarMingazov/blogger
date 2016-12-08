require 'rails_helper'
describe 'Post API' do
  it 'return a post' do
    post = FactoryGirl.create(:post)
    get "/api/v1/posts/#{post.id}"
    expect(response).to be_success
  end
end
