# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key do
    scope "session"
    association :tokenable, factory: :user, strategy: :create
  end
end
