FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@test.com"}
    password "password"
  end

  factory :project do
    user
    sequence(:name){|n| "project#{n}"}
  end

  factory :task do
    project
    sequence(:name){|n| "task#{n}"}
    expires_on { Date.today + 3 }
    sequence(:rank)
  end
end
