FactoryGirl.define do
  factory :post do
    title "title"
    body "body"
    association :user, factory: :user
  end
end
