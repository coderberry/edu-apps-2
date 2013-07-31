# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lti_app do
    short_name "vimeo"
    name "Vimeo"

    association :user, factory: :user, strategy: :create
  end
end
