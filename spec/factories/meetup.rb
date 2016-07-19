FactoryGirl.define do
  factory :meetup do
    name "Ein Bier Bitte"
    location_name "Jacob Wirth's"
    address "33 Harrison Ave"
    city "Boston"
    state "MA"
    zip "02111"
    description "Come join us for a night of drink and German"
    language "German"
    date "January 13, 2017"
    time "9pm"
  end
end
