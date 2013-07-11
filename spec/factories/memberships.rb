# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    is_admin true
    association :user, factory: :user, strategy: :create
    association :organization, factory: :organization, strategy: :create
  end
end
