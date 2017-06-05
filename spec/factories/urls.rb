FactoryGirl.define do
  factory :url do
    sequence :address { |n| "https://en.wikipedia.org/wiki/#{n}" }
  end
end
