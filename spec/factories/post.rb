FactoryGirl.define do
  factory :post do
    sequence(:body) { |num| "test#{num}" }
  end
end
