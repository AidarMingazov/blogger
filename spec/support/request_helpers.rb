module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
end

def login(user)
  post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
end

def sign_in(user)
  header('Authorization', "Token token=\"#{user.authentication_token}\", email=\"#{user.email}\"")
end
