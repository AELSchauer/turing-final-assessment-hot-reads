FactoryGirl.define do
  factory :read do
    sequence :user_id { |n| n }
    url
  end
end
