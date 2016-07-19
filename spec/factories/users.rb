FactoryGirl.define do
  factory :user do
    sequence(:email) { |num| "test#{num}@gmail.com" }
    sequence(:first_name) { |num| "John#{num}" }
    sequence(:last_name) { |num| "Smith#{num}" }
    sequence(:screen_name) { |num| "figaro#{num}" }
    sequence(:language) { |num| "Spanish#{num}" }
    sequence(:location) { |num| "Boston#{num}" }
    password "test1234"
  end
end
