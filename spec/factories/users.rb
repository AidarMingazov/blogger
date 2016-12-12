FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name[0..11] }
    last_name { Faker::Name.last_name[0..11] }
    password "123456"
    password_confirmation { password }
  end
end
