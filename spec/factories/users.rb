# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "cyril76928@gmail.com"
    password "12341234"
    first_name "Tung-Keng"
    last_name  "Lee"
    street '5700 Centre Ave.'
    country  "USA"
    zip  "15206"
    phone  "4126801073"
    reward_points 0
    active 1
  end
end
