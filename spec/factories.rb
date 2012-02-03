FactoryGirl.define do
  factory :user do
    name 'Steve'
    password 'please'
    sequence(:email) {|n| "email#{n}@mail.com" } 
  end
end
