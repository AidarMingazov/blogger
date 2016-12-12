FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
<<<<<<< HEAD
    first_name { Faker::Name.first_name[0..12] }
    last_name { Faker::Name.last_name[0..12] }
    sequence(:nickname) { |n| "#{first_name}_#{n}" }
=======
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    # sequence(:nickname) { |n| "#{first_name}_#{n}" }
>>>>>>> user
    password "123456"
    password_confirmation { password }
  end
end
