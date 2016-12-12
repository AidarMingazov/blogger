FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    # sequence(:nickname) { |n| "#{first_name}_#{n}" }
    password "123456"
    password_confirmation { password }
  end
end
