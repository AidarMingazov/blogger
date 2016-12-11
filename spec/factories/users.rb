FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name[0..12] }
    last_name { Faker::Name.last_name[0..12] }
    sequence(:nickname) { |n| "#{first_name}_#{n}" }
    password "123456"
    password_confirmation { password }
  end
end
